<?php
$single_bank_info = $this->db->get_where('banktbl', array('id' => $param2))->result_array();
foreach ($single_bank_info as $row) {
?>
<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_bank'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?admin/bank_settings/update/<?php echo $row['id']; ?>" method="post" enctype="multipart/form-data">
                
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('bank_id'); ?></label>

                        <div class="col-sm-5">
                            <input disabled type="text" name="id" class="form-control" id="field-1" value="<?php echo $row['id']; ?>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('bank_name'); ?></label>

                        <div class="col-sm-5">
                            <input type="text" name="name" class="form-control" value="<?php echo  $row['name']; ?>" >
                        </div>
                    </div>
                    <div class="col-sm-3 control-label col-sm-offset-1">
                        <input type="submit" class="btn btn-success" value="Submit">
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>
<?php } ?>