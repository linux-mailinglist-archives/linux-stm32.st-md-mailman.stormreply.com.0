Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3872A46B7
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 14:39:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B39BC36B35;
	Tue,  3 Nov 2020 13:39:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E64FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 13:39:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3DbkJe011808; Tue, 3 Nov 2020 14:38:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=veJLxaZum4JdTDrVxKHaiJiTG54WMzCcdpwiNPTXfGs=;
 b=AC3Rtnim66NSR4Kc9Bid+9yMvnx84VoNGxN69+my2YlB88rFz2AimLb2cw/z4+5b9EZ1
 8HsTxSeH/lbUST1wQyNwjpn2T56IwucKy3/EaiMKQHwQbqTNEmzKH7l+YpiX50jpa7SZ
 WyuJPqCUgC+8Rku/1ZPTUaUlTHgn7Jxwu4oMYEr/JS9pTIznRPg4gvgsjZRsVsQqJnAs
 G/aaTzsfYXTT+XvhavkJcrkAkqXxAHrkcB29Wq+rf/oLIp2saCmJ9N8vnTmtI6tNd0pu
 Iv/vIBlL3bdyttxNueFT/kzvT0th7ktp4PlQsWfX+2bekovJlbJTKwzZPtgTi/oOSzZ2 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywqspcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 14:38:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F59F100034;
 Tue,  3 Nov 2020 14:38:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DA26254067;
 Tue,  3 Nov 2020 14:38:28 +0100 (CET)
Received: from SFHDAG2NODE2.st.com (10.75.127.5) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 14:38:27 +0100
Received: from SFHDAG2NODE2.st.com ([fe80::14c2:73ff:db87:a27b]) by
 SFHDAG2NODE2.st.com ([fe80::14c2:73ff:db87:a27b%20]) with mapi id
 15.00.1473.003; Tue, 3 Nov 2020 14:38:27 +0100
From: Olivier MOYSAN <olivier.moysan@st.com>
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
 <tiwai@suse.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "robh@kernel.org" <robh@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Thread-Topic: [PATCH 0/2] ASoC: stm32: i2s: add master clock provider
Thread-Index: AQHWiBzGV/vdLD0mo0u9KLFGd/U756m2rDkA
Date: Tue, 3 Nov 2020 13:38:27 +0000
Message-ID: <20ed825b-10b6-e71f-9da4-91df38a950de@st.com>
References: <20200911091952.14696-1-olivier.moysan@st.com>
In-Reply-To: <20200911091952.14696-1-olivier.moysan@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <7BA6C81104F79949A06BE598EA49E90B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: i2s: add master clock
	provider
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

Hi Mark,

Gentle reminder on this series, as it seems that there was no update 
since Rob's "reviewed-by" for dt bindings, on 11/09.

BRs
Olivier

On 9/11/20 11:19 AM, Olivier Moysan wrote:
> Add master clock generation support in STM32 I2S driver.
> 
> Olivier Moysan (2):
>    ASoC: dt-bindings: add mclk provider support to stm32 i2s
>    ASoC: stm32: i2s: add master clock provider
> 
>   .../bindings/sound/st,stm32-i2s.yaml          |   4 +
>   sound/soc/stm/stm32_i2s.c                     | 310 +++++++++++++++---
>   2 files changed, 270 insertions(+), 44 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
