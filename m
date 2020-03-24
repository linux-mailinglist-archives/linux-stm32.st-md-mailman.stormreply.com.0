Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF7190B39
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 11:38:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664DFC36B0B;
	Tue, 24 Mar 2020 10:38:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAAF7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 10:38:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02OASjEF027802; Tue, 24 Mar 2020 11:38:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qjix0X4rFPtS9PXPYAPD9xbtsp4+DScbfwh25ikjWl0=;
 b=gENvra/KxMaUTgzVIC6WWgx8cNmguR7U6Oi46nV1B7+ehSp2XpF68k3i+d3gAYLXCIJ5
 I12o+MExVwWDIMtxBcS1SaJ/ABFsQXJcG+x5f89gpjajPD1FKFi59fqXM+620PbZibgB
 pkQm5SoMDZ862hxomvlXUp6v/Ls9Y3VfVV+vHT+ypPfWXu5knoNPCaE8PHr4uMujAV8q
 58RLoC7mEzpYzMQwQIN+MVZYnQ6Lglpry52Vi8mj65uXwEStg+0TgdH37PwuAYSp65D0
 nc+Nfuz2p7Bev1D/KxKA368dwaljN0WDVB8VOqeKWyS7G0kjZDN0RQQ8OU4TJmDs3++x mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yw9jyxxeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 11:38:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 022B5100038;
 Tue, 24 Mar 2020 11:38:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DE9182A6EC5;
 Tue, 24 Mar 2020 11:38:10 +0100 (CET)
Received: from [10.211.5.183] (10.75.127.48) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 24 Mar
 2020 11:38:09 +0100
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
 <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <bac5f70c-5e12-2ac1-fc35-46f838f4d480@st.com>
Date: Tue, 24 Mar 2020 11:38:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_03:2020-03-23,
 2020-03-24 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [10/12] mtd: rawnand: stm32_fmc2: use regmap APIs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 3/24/20 1:44 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
> [...]
>> @@ -531,11 +515,11 @@ static int stm32_fmc2_nfc_bch_correct(struct nand_chip *chip, u8 *dat,
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> -	ecc_sta[0] = readl_relaxed(nfc->io_base + FMC2_BCHDSR0);
>> -	ecc_sta[1] = readl_relaxed(nfc->io_base + FMC2_BCHDSR1);
>> -	ecc_sta[2] = readl_relaxed(nfc->io_base + FMC2_BCHDSR2);
>> -	ecc_sta[3] = readl_relaxed(nfc->io_base + FMC2_BCHDSR3);
>> -	ecc_sta[4] = readl_relaxed(nfc->io_base + FMC2_BCHDSR4);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR0, &ecc_sta[0]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR1, &ecc_sta[1]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR2, &ecc_sta[2]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR3, &ecc_sta[3]);
>> +	regmap_read(nfc->regmap, FMC2_BCHDSR4, &ecc_sta[4]);
> 
> Would regmap_bulk_read() work here ?
> 

Hi Marek,

Yes, regmap_bulk_read can be used. It will be done on V2.

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
