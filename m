Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8292AB28D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 09:38:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3A0FC3FAE2;
	Mon,  9 Nov 2020 08:38:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81DF7C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 08:38:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A98WYdR009701; Mon, 9 Nov 2020 09:38:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vHLS0bIzw5/h0yGMsmkOgooOEMMNvU/GzA5iF0cEp9g=;
 b=1DoW/1wfhl7PPBsyuC7OgVxCKu67Jf2DvVdkL/aAXDpFHZaxrp+wvtHb+A6EKoCnFsu3
 Qx3zE9IEKTPi9IiZ1hwY1GA4x80q2kbKz+LXZBI7sbJaBLHcA0ydMOSLf8bOPyj9IKGO
 rWsJ1eCoMzFCsXl8AHAfXoMUl4CroKnmf/mPD5GRQ+OjYMIwieUdpitPhb1F1r4CdLqE
 6bvw3jKWM8keGX5rezccYdOdZaSxIVs1ZnJQxJCyWX2eNfqu56I1+A0ruX6obkwSsF7g
 e9PMhllfeSp1N/jp/0GjlZvbmSbDvcfqXHnxWTy4O0GF3rcCRyoTQr+RQZlvrFjR/ZkO vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nj80gspj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 09:38:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B085B10002A;
 Mon,  9 Nov 2020 09:38:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36963230480;
 Mon,  9 Nov 2020 09:38:34 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 09:38:33 +0100
To: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
 <016661fc-e9dd-bd4a-f26d-00e54626f030@st.com>
 <20201106115308.GO26150@paasikivi.fi.intel.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <027a0bb1-788e-dc73-a941-4d55c8ec5481@st.com>
Date: Mon, 9 Nov 2020 09:37:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106115308.GO26150@paasikivi.fi.intel.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Alain Volmat <alain.volmat@st.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/4] DCMI BT656 parallel bus mode
	support
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

Hi Sakari

On 11/6/20 12:53 PM, Sakari Ailus wrote:
> Hi Alexandre,
> 
> On Thu, Nov 05, 2020 at 10:26:37AM +0100, Alexandre Torgue wrote:
>> Hi Huges
>>
>> On 11/4/20 6:32 PM, Hugues Fruchet wrote:
>>> Add support of BT656 embedded synchronization bus.
>>> This mode allows to save hardware synchro lines hsync & vsync
>>> by replacing them with synchro codes embedded in data stream.
>>> Add "bus-type" property and make it required so that there is no
>>> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
>>>
>>> ===========
>>> = history =
>>> ===========
>>> version 5:
>>>     - Add revisited bindings and devicetree with explicit use of "bus-type"
>>>
>>> version 4:
>>>     - Fix typo in commit message
>>>
>>> version 3:
>>>     - Fix bus_width print to %u as per Sakari comment
>>>
>>> version 2:
>>>     - As per Sakari remark, revisit commit message and document
>>>       BT656 parallel bus mode in bindings
>>>
>>> version 1:
>>>     - Initial submission
>>>
>>> Hugues Fruchet (4):
>>>     media: stm32-dcmi: add support of BT656 bus
>>>     media: dt-bindings: media: st,stm32-dcmi: add support of BT656 bus
>>>     ARM: dts: stm32: set bus-type in DCMI endpoint for stm32mp157c-ev1
>>>       board
>>>     ARM: dts: stm32: set bus-type in DCMI endpoint for stm32429i-eval
>>>       board
>>>
>>>    .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
>>>    arch/arm/boot/dts/stm32429i-eval.dts               |  1 +
>>>    arch/arm/boot/dts/stm32mp157c-ev1.dts              |  1 +
>>>    drivers/media/platform/stm32/stm32-dcmi.c          | 37 +++++++++++++++++++--
>>>    4 files changed, 75 insertions(+), 2 deletions(-)
>>>
>>
>> I'll take DT patches on stm32-next tree.
> 
> Just checking: that is only the two last patches in the set, or also the
> binding patch?

Usually I let drivers/subsystem maintainer taking dt-bindings patches 
with drivers patches.
(If binding changes come only with dts(i) patches I take them in my tree)

-->So yes I'll take only the last two patches.

Regards
alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
