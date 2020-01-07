Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C4132799
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 14:30:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 920E2C36B0B;
	Tue,  7 Jan 2020 13:30:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21E51C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 13:30:27 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007DRfU8012025; Tue, 7 Jan 2020 14:30:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sh/Hcpph+fyyvxbpOaXrOQFv55vXYoYyE8APS/2sZ98=;
 b=GVil49yGoH38YfsdtnaXdGUVOgL/KG1fV1KDTXLOpJSUA8rdAGkMyTTffl7Gn90qeJ/p
 1Tk+FcstZedynXbKxcaTXhWNVjlTFVdP0DH1FZesoi1xoNzWiGHOc3cq7J+fkhp9s6Gc
 gLqYbKUBiUrDrMxlcEPfcrzgBnFvEjFVTHTLilz8YCftht+6bcykuE/w5zuvrUrdUAUv
 /pT6DELsyvnIASwb67EC0Dbxdxx8iDZFL4jGnNs+pk2+zLPFil9O2nAygXucU+t/ETAn
 /ywFQO/mIshDn97BO/e/FNhhGqB933jpUTgn5mWZFV1q9/MRfsANSfMiKC8lYMHdogZg 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkaphbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 14:30:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 221B510002A;
 Tue,  7 Jan 2020 14:30:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag4node1.st.com [10.75.127.10])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C66C92B7721;
 Tue,  7 Jan 2020 14:30:14 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG4NODE1.st.com
 (10.75.127.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 14:30:14 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 7 Jan 2020 14:30:14 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Sriram Dash <sriram.dash@samsung.com>, 'Jose Abreu'
 <Jose.Abreu@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Thread-Topic: [Linux-stm32] [PATCH net] net: stmmac: Fixed link does not need
 MDIO Bus
Thread-Index: AQHVxV6XXqj37Urfek+F1jboTMK33g==
Date: Tue, 7 Jan 2020 13:30:14 +0000
Message-ID: <4330eb5a-1dfa-783c-69c9-35692db65341@st.com>
References: <CGME20200107123550epcas5p2d1914646e71e0ff0095b4a14eb5e1551@epcas5p2.samsung.com>
 <5764e60da6d3af7e76c30f63b07f1a12b4787918.1578400471.git.Jose.Abreu@synopsys.com>
 <014201d5c559$3e6204b0$bb260e10$@samsung.com>
In-Reply-To: <014201d5c559$3e6204b0$bb260e10$@samsung.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <1785DA2E48A9B045A6DD91BAA51E0F40@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
Cc: 'Florian Fainelli' <f.fainelli@gmail.com>,
 'Heiko Stuebner' <heiko@sntech.de>, "'kernelci . org bot'" <bot@kernelci.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 'Joao Pinto' <Joao.Pinto@synopsys.com>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>,
 Peppe CAVALLARO <peppe.cavallaro@st.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fixed link does not need
 MDIO Bus
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

Hi All

On 1/7/20 1:51 PM, Sriram Dash wrote:
>> From: Jose Abreu <Jose.Abreu@synopsys.com>
>> Subject: [PATCH net] net: stmmac: Fixed link does not need MDIO Bus
>>
>> When using fixed link we don't need the MDIO bus support.
>>
>> Reported-by: Heiko Stuebner <heiko@sntech.de>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>> Fixes: d3e014ec7d5e ("net: stmmac: platform: Fix MDIO init for platforms
>> without PHY")
>> Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>
> Acked-by: Sriram Dash <Sriram.dash@samsung.com>

Tested on STiH410-B2260 board

Tested-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

>> ---
>> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
>> Cc: Alexandre Torgue <alexandre.torgue@st.com>
>> Cc: Jose Abreu <joabreu@synopsys.com>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: netdev@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: kernelci.org bot <bot@kernelci.org>
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>> Cc: Sriram Dash <sriram.dash@samsung.com>
>> ---
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index cc8d7e7bf9ac..4775f49d7f3b 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device
>> *pdev,  static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
>>  			 struct device_node *np, struct device *dev)  {
>> -	bool mdio = false;
>> +	bool mdio = !of_phy_is_fixed_link(np);
>>  	static const struct of_device_id need_mdio_ids[] = {
>>  		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
>>  		{},
>> --
>> 2.7.4
>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
