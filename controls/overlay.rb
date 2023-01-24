include_controls 'oracle-database-19c-cis-baseline' do
  
  control 'oracle19c-1.1' do
    impact 0.0
    describe 'For AWS RDS instances, a manual review is required to verify the expected path version. For example: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.CommonDBATasks.Misc.html' do
      skip 'For AWS RDS instances, a manual review is required to verify the expected path version. For example: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.Oracle.CommonDBATasks.Misc.html'
    end
  end

  control 'oracle19c-2.1.1' do
    impact 0.0
    desc 'caveat', 'Not applicable since these listener.ora settings are not available under AWS RDS instances'
  end

  control 'oracle19c-2.1.2' do
    impact 0.0
    desc 'caveat', 'Not applicable since these listener.ora settings are not available under AWS RDS instances'
  end

end