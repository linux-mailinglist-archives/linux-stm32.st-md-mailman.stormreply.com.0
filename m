Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCE1829608
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jan 2024 10:15:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D3A5C6DD73;
	Wed, 10 Jan 2024 09:15:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FAEEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jan 2024 09:15:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40A8aGnq018108; Wed, 10 Jan 2024 10:15:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Oa0IFcQkZD0/owTviDimI7+i56Xf68eQjrWsXc8swwE=; b=7+
 MoRUnP66xGbpAivfKSxhkbeuHLkaFvGnOXwo91qiWXXUYUkMNdh4MaQuRenc5jW6
 Nh0r6WirKmHuZKhGBK59bGhD3Pc0lE6Vw3GblB+Wd6eplEGcZFrPFGkMyv+6uaza
 PeUFWuOdZy7RgjMlZ7OgEdNQCNwxtSyq1B95/3kV6cQjnCVshXC+Xmkb81bMU6gK
 yAV2QG466tXYNMzD2cS4WN8uu3O2TCtKRUbM8hH7fv3KFMYhh/ICGm80lQkFk4qs
 117SSsB5OV18pk4WO/vSdGHcs8y090oNztBm5+nInhuUi/Vc32o8py3pp0L4oNKG
 3449v/kVxfbrJmvt5ilA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vey30qrvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 10:15:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2540610004A;
 Wed, 10 Jan 2024 10:15:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1692B24B892;
 Wed, 10 Jan 2024 10:15:06 +0100 (CET)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 10:15:04 +0100
Message-ID: <733bee3f-98ae-4f51-a1c5-6c09b38328ce@foss.st.com>
Date: Wed, 10 Jan 2024 10:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20240109085155.252358-1-hugues.fruchet@foss.st.com>
 <20240109085155.252358-2-hugues.fruchet@foss.st.com>
 <9ecc73a1-7457-45a2-ade1-c91b8e7176da@kernel.org>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <9ecc73a1-7457-45a2-ade1-c91b8e7176da@kernel.org>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Marco Felsch <m.felsch@pengutronix.de>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v6 1/5] dt-bindings: media: Document
 STM32MP25 VDEC & VENC video codecs
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

Hi Krzysztof,

On 1/9/24 22:49, Krzysztof Kozlowski wrote:
> On 09/01/2024 09:51, Hugues Fruchet wrote:
>> Add STM32MP25 VDEC video decoder & VENC video encoder bindings.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling.
> 
> Please kindly resend and include all necessary To/Cc entries.

My fault when sending this exact v6, sorry for that.. It was done the 
right way for previous versions and no issues raised by automated tools.

> 
> While resending drop redundant blank line after SPDX. See all other
> bindings and example-schema.
I have double checked and I don't see any problem related to redundant 
blank lines in yaml after SPDX:

+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-video-codec.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2

Could you point me out what is the exact issue ?

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
