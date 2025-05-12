Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1BAB3645
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 13:53:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 422BDC78F93;
	Mon, 12 May 2025 11:53:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C381C78F92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 11:53:25 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CAeG2P004639;
 Mon, 12 May 2025 13:53:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VlcV0kRPaTfk5YK6ZyqecQK16+pijh8il4Op3fbctew=; b=vS+LrQswgnOdeU02
 AJAX5CoLB1+iKNrpHnJt8/1j647MTkFSFqx+2CkI6Dc301/Gv5dTTTI/5CVH5lgf
 i8wQk6r8wybepprii5hAgzr/BYZxpJ8rPhs4vCj4dQsBPxjgfvzgspGvkmhsKw39
 y8lJLeC0My7w1b+xgrSKFDq42ph5CGnJIJOZ6nwuENGFmPA1MhE7aN/uxS2p+din
 iDHaXHpq7MOnu0zeCs/TxSoRHLgtkHJGf9y7fzIZjawNr0k1LjnXEkZJvNqEjFzy
 ogG+4Hx7F1pGtvaU90RBlSI56DVeYCApMr7SSLfvknTEw95aEQwufvmPa3ImN3if
 bUlbVg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46jgc44ne6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 13:53:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 93CB84004A;
 Mon, 12 May 2025 13:52:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBB1CAF5655;
 Mon, 12 May 2025 13:51:47 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 13:51:47 +0200
Message-ID: <a5c0f081-b3e1-42c0-980f-2e4ad1d766df@foss.st.com>
Date: Mon, 12 May 2025 13:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250512-upstream_omm_ospi_dts-v10-0-fca0fbe6d10a@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v10 0/3] arm64: dts: st: Add SPI NOR
 support for stm32mp257f-ev1
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

Hi Patrice

On 5/12/25 08:29, Patrice Chotard wrote:
> Add SPI NOR support for stm32mp257f-ev1 board by adding:
>    _ Octo memory Manager node in stm32mp251.dtsi
>    _ OSPI port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>    _ Add SPI NOR support for stm32mp257f-ev1.dts
> 
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v10:
> - rebase on top of next-20250509 to fix DTB warnings.
> - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_dts-v9-0-62522b1b0922@foss.st.com
> 
> Changes in v9:
>    - split patchset by susbsystem, current one include only DTS related
>      patches.
>    - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> 
> ---
> Patrice Chotard (3):
>        arm64: dts: st: Add OMM node on stm32mp251
>        arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctrl.dtsi
>        arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
> 
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 51 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 54 +++++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 32 ++++++++++++++++
>   3 files changed, 137 insertions(+)
> ---
> base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
> change-id: 20250410-upstream_omm_ospi_dts-04b97cc02e52
> 
> Best regards,

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
