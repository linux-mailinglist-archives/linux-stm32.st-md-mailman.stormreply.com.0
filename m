Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 126AA84B273
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 11:24:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC42FC6907A;
	Tue,  6 Feb 2024 10:24:02 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53A87C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 10:24:01 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4169iw9L025133; Tue, 6 Feb 2024 04:23:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=PODMain02222019; bh=v8WU0lB9flpGY7v
 YDfUpKZOIGwF1bC5Mlqhymq+hVuI=; b=Gq4i2HaZBxfaa9D+cEHHCkIim11Aq+L
 PsNfQCWEW/RohMHzj0MnwF9nyXJoQyaQubAxDrlPApglgBXw0Tvtf/px2vdmfLYv
 GSjZyVUaRg/A4TXB1Af6DwIP7K9jOLni5AgK8O8el8CUiAcoiNI36wfWIX7Yx9q2
 +RH3aKAEpHFGg8h+W7RkXMCEL92bLlBaIANFvIFkv6MSF3OqKzKVI/GtcmBt1Aeh
 D0TDVyCkgJ/ydhQx45QDBWNy8Sn9N1sMqxP6Ly0ZgAumPhVzd4GcBPh4MHToFQP3
 wnUaon/CBqLht8YtsL+jDbw4Z9onUqFhuTc/zsVljd2CV0kWe2AGiSA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnk6h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Feb 2024 04:23:30 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 10:23:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 10:23:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9CD37820241;
 Tue,  6 Feb 2024 10:23:28 +0000 (UTC)
Date: Tue, 6 Feb 2024 10:23:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bo Liu <liubo03@inspur.com>
Message-ID: <ZcIIn6b+BFR/FRIS@ediswmail9.ad.cirrus.com>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <20240206071314.8721-11-liubo03@inspur.com>
 <ZcIEFxh76TTXBTiT@ediswmail9.ad.cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcIEFxh76TTXBTiT@ediswmail9.ad.cirrus.com>
X-Proofpoint-GUID: VZagnLkW2TlCS_BzEYBGYEssTNO5DPkf
X-Proofpoint-ORIG-GUID: VZagnLkW2TlCS_BzEYBGYEssTNO5DPkf
X-Proofpoint-Spam-Reason: safe
Cc: neil.armstrong@linaro.org, support.opensource@diasemi.com,
 mazziesaccount@gmail.com, linux-kernel@vger.kernel.org, lee@kernel.org,
 rf@opensource.cirrus.com, linux-renesas-soc@vger.kernel.org, wens@csie.org,
 mcoquelin.stm32@gmail.com, patches@opensource.cirrus.com,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, marek.vasut+renesas@gmail.com
Subject: Re: [Linux-stm32] [PATCH 10/18] mfd: wolfson: convert to use maple
 tree register cache
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

On Tue, Feb 06, 2024 at 10:04:07AM +0000, Charles Keepax wrote:
> On Tue, Feb 06, 2024 at 02:13:06AM -0500, Bo Liu wrote:
> >  drivers/mfd/wm5102-tables.c | 2 +-
> >  drivers/mfd/wm5110-tables.c | 2 +-
> >  drivers/mfd/wm8350-regmap.c | 2 +-
> >  drivers/mfd/wm8400-core.c   | 2 +-
> >  drivers/mfd/wm97xx-core.c   | 6 +++---
>
> seems a bit weird not to convert wm8997, wm8998 and cs47l24.
> These are part of the same driver as wm5102 and wm5110.

Nevermind, it seems those parts were already converted.

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
