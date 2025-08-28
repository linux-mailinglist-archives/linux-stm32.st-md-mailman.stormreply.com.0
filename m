Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8286B39F70
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 15:56:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE29C3F95E;
	Thu, 28 Aug 2025 13:56:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79475C3F95D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 13:56:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SBnI4b026021;
 Thu, 28 Aug 2025 15:55:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Dm6i+EpyE8QWt4iCU85NedWZbbxEmH/7ZoLUzNKJkZY=; b=mKNgIkdjnJ69Uacm
 r1W22+vpUjzgOSBN+1ZubxX1Ff+Hd6brat1mwbIqER2QKsFc+VNNWLo9+iXZV1bx
 U9H06JDsYUVEZ/9CuY7YIjkwCPxv22cS++8EoCsoR3pHH6t0PKnUjcWINPZh7EI5
 EE6T73pCi+hoN1otSsxtrBl6y6i/zpkg8MY4YeUR76corYBIf5WZfOhi60sSpdYL
 rwCi76BlFvV6M7aAnKeeXZUC16zoj8mpKX0CCFBBUb9/5FB5WJGH+lHfVpPvYqVt
 ID6zdZjWPrSW84SmsgU5asZAsfttFgXXl6CJjd3NCsNg7OT4s33TaTmK6iVZnIwk
 /ElwSg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q626vktc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 15:55:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3ABAA40048;
 Thu, 28 Aug 2025 15:54:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C14A74F6C6;
 Thu, 28 Aug 2025 15:53:27 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 28 Aug
 2025 15:53:26 +0200
Message-ID: <676469fd-b957-79f5-9483-749c66bdf270@foss.st.com>
Date: Thu, 28 Aug 2025 15:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20250822-drm-misc-next-v5-8-9c825e28f733@foss.st.com>
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 08/13] drm/stm: ltdc: handle lvds pixel
	clock
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



On 8/22/25 16:34, Raphael Gallais-Pou wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Handle LVDS pixel clock.
> 
> The LTDC operates with multiple clock domains for register access,
> requiring all clocks to be provided during read/write operations.  This
> imposes a dependency between the LVDS and LTDC to access correctly all
> LTDC registers.  And because both IPs' pixel rates must be synchronized,
> the LTDC has to handle the LVDS clock.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 22 +++++++++++++++++++++-
>   drivers/gpu/drm/stm/ltdc.h |  1 +
>   2 files changed, 22 insertions(+), 1 deletion(-)

Hi Raphael,

Acked-by: Philippe Cornu <philippe.cornu@foss.st.com>

Thanks a lot
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
