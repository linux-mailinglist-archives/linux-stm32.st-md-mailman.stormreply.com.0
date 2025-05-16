Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4752AB9CC8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 14:58:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C144C7A840;
	Fri, 16 May 2025 12:58:27 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 814B0C7A829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 12:58:26 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB2cC6002118;
 Fri, 16 May 2025 14:58:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3vjseJYbJT5ETJFPoncHRVVX4/JCv6agmUw3wmhKosc=; b=h6kvDvfd3E/ew6uD
 kIA4mZS2tnjaseju95OgnOlcaevnuXwOZJvA36MXrggZ/Hr7PdgvofDVTarF8Ygx
 KFMVVv8lABPdDH6QhBWt1yNLdOHWgCjglzDTT6MURdczeInpIVdBFl1U6j2eriHK
 ga0oVq4B+n0RWP2EFXFlCK3S/xisYYw8Z9soT15E74cr1eRFcDn6onQcZqPOqaNO
 i9mY5whVoiTkjperNXUXlhd8t1trzhw3qYmuAK3KX22+sCEJOu9DDTeAmUAO9XAj
 A3A4/C457uS9c3CjHYHd1EtwweqJdhzUQ41LXkiZ8iXL51uhSuD++EGj2trv82u/
 bWkdYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdwe848-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 May 2025 14:58:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F01D740063;
 Fri, 16 May 2025 14:57:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C4D70B44890;
 Fri, 16 May 2025 14:56:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 14:56:23 +0200
Message-ID: <ae7b8134-923c-4967-b25c-fc1411fd0602@foss.st.com>
Date: Fri, 16 May 2025 14:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>
References: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
 <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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



On 5/15/25 11:19, Mark Brown wrote:
> On Wed, May 14, 2025 at 03:56:01PM +0200, Patrice Chotard wrote:
> 
>> This patch is dependent on commit 6b3754009f87
>> ("reset: Add devm_reset_control_array_get_exclusive_released()")
>> available on tag reset-for-v6.16.
> 
> When telling people about dependencies like this the standard thing is
> to also specify the repostiory, or link to a pull request.  The git
> repository is needed to actually pull the tag.  This appears to be the
> PR at:
> 
>    https://lore.kernel.org/all/20250513092516.3331585-1-p.zabel@pengutronix.de/
> 
> which is the full reset pull request for v6.16.  The commit you
> referenced isn't the tagged commit, it's further back in the history
> but still has a whole new reset driver backed up behind it.  I'd have
> expected that if this was expected to be pulled into other subsystems
> it'd be on a topic branch and directly tagged?

Hi Mark

Sorry for that, how do you want me to proceed ?

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
