Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9003B025F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Jun 2021 13:07:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F49AC57B53;
	Tue, 22 Jun 2021 11:07:00 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BE07C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Jun 2021 11:06:58 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MB6CdB020763; Tue, 22 Jun 2021 11:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=XR2nNG0NDF5ge5Ufod7mLKPjDb/WKB7nonUXU+zYpK8=;
 b=rAHhc6sCXBIU5pJe9zmWaTfPg7dWzlslRY75rQBnWF6PPj9eK6wSE2jYaDcFiJ80z0rf
 p7MIUElTaOlVo5lkZC8SSTJ9df1iQ4sSlNkfrM+AHCkr+FettKP31wYOOW35l8fvSNp5
 jkGTlhKUyBqCOVEXFYbyQ6GuKx/ky/VRpp2QQciTu0VvuvnS04AFKqm/cSSHgHm3cdTW
 zV7WBZAZT4weaxw0D7LRdVZaZ9W2JAZ6ZI4F4M2Aaf31cWPCLowDAqRB7eNvJXQH8696
 1KmdlC+ApZgcuUcDzFDO+lZgkvRcFH8bLb9sllxsRgRXue9x9tuqEqvOs3qCCHRxLiOj kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39b98v8u1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:06:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MB5PKj027625;
 Tue, 22 Jun 2021 11:06:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 3998d779kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:06:51 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MB6opm032581;
 Tue, 22 Jun 2021 11:06:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 3998d779ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:06:50 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15MB6nI5004247;
 Tue, 22 Jun 2021 11:06:49 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Jun 2021 11:06:48 +0000
Date: Tue, 22 Jun 2021 14:06:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: zhangqing@loongson.cn
Message-ID: <YNHEQ5J1IJHoN2b2@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: v_MlQNpVAfzzSl5dwxnSMlZhwEK5rDII
X-Proofpoint-GUID: v_MlQNpVAfzzSl5dwxnSMlZhwEK5rDII
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] stmmac: pci: Add dwmac support for
	Loongson
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Qing Zhang,

The patch 30bba69d7db4: "stmmac: pci: Add dwmac support for Loongson"
from Jun 18, 2021, leads to the following static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:111 loongson_dwmac_probe()
	warn: unsigned 'plat->phy_interface' is never less than zero.

drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
    97          /* Get the base address of device */
    98          for (i = 0; i < PCI_STD_NUM_BARS; i++) {
    99                  if (pci_resource_len(pdev, i) == 0)
   100                          continue;
   101                  ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
   102                  if (ret)
   103                          return ret;
   104                  break;
   105          }
   106  
   107          plat->bus_id = of_alias_get_id(np, "ethernet");
   108          if (plat->bus_id < 0)

plat->bus_id is unsigned so this can't be true.

   109                  plat->bus_id = pci_dev_id(pdev);
   110  
   111          plat->phy_interface = device_get_phy_mode(&pdev->dev);
   112          if (plat->phy_interface < 0)
   113                  dev_err(&pdev->dev, "phy_mode not found\n");
   114  
   115          plat->interface = PHY_INTERFACE_MODE_GMII;
   116  
   117          pci_set_master(pdev);
   118  
   119          loongson_default_data(plat);
   120          pci_enable_msi(pdev);

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
