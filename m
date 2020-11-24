Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 075162C2DA4
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 18:02:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9259C56630;
	Tue, 24 Nov 2020 17:02:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C870C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 17:02:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOGwOtl001893; Tue, 24 Nov 2020 18:01:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=Nvh97EHtowShFVZBZ4sch+HIM7kUYQxi6C+/PmxMtLQ=;
 b=gxROogSxGpqeDGs2jIP+hvUwtpgGi+re5iwqH6X5WupCiV1aclAZL5OiOHpQJUsUq7Ov
 cfnFD2w9PEtd2BzPji8u7W2RT29V+hsYdHaIMQTJTynKJTe9eGI5y9cifnJm4KHZb9/V
 qNBH+ph6Ky8nMGSohFNbCz7RryiJWuefGCV/QTr0mdst8IGeB89zUoFqjm0ut70Z9I1p
 5CL9lKDMjLqYV1NxSUU5Rgzt/tjCY8F8xfJPucUxoeip/ItJGyFwE45evtBmgFoES3kJ
 IruzAC+DAYJHr3h2hrcrsSYcyoeThThMmgRMDfvU1Ye/tCN3mzyA1A+WoMdTdV+yxem8 eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05h8qjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 18:01:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64952100034;
 Tue, 24 Nov 2020 18:01:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4306D21037A;
 Tue, 24 Nov 2020 18:01:40 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.49) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 18:01:35 +0100
Message-ID: <bd0a636c351b05e0faa1b9009cb09334bc72cee4.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Willy Liu
 <willy.liu@realtek.com>, Heiner Kallweit <hkallweit1@gmail.com>
Date: Tue, 24 Nov 2020 18:00:46 +0100
In-Reply-To: <20201124153750.GH1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124145647.GF1551@shell.armlinux.org.uk>
 <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
 <20201124153750.GH1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_05:2020-11-24,
 2020-11-24 signatures=0
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

On Tue, 2020-11-24 at 15:37 +0000, Russell King - ARM Linux admin wrote:
> On Tue, Nov 24, 2020 at 04:17:42PM +0100, Antonio Borneo wrote:
> > On Tue, 2020-11-24 at 14:56 +0000, Russell King - ARM Linux admin wrote:
> > > Userspace doesn't expect the advertising mask to change beneath it.
> > > Since updates from userspace are done using a read-modify-write of
> > > the ksettings, this can have the undesired effect of removing 1G
> > > from the configured advertising mask.
> > > 
> > > We've had other PHYs have this behaviour; the correct solution is for
> > > the PHY driver to implement reading the resolution from the PHY rather
> > > than relying on the generic implementation if it can down-shift
> > 
> > If it's already upstream, could you please point to one of the phy driver
> > that already implements this properly?
> 
> Reading the resolved information is PHY specific as it isn't
> standardised.

Digging in the info you have provided, I realized that another Realtek PHY
has some specific code already upstream to deal with downshift.
The PHY specific code is added by Heiner in d445dff2df60 ("net: phy:
realtek: read actual speed to detect downshift").
This code reads the actual speed from page 0xa43 address 0x12, that is not
reported in the datasheet of rtl8211f.
But I checked the register content in rtl8211f and it works at the same way
too!

I have added Willy in copy; maybe he can confirm that we can use page 0xa43
address 0x12 on rtl8211f to read the actual speed after negotiation.

In such case the fix for rtl8211f requires just adding the same custom
read_status().

Antonio


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
