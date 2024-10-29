Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D419B4EDA
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 17:05:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31D30C71290;
	Tue, 29 Oct 2024 16:05:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08256C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 16:05:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCOSNf022762;
 Tue, 29 Oct 2024 17:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A9RHv1s9fRZ1l/E0wCeEXv4fppRhjYbx9rteeeM09nk=; b=Hzt5EAsS/nPCClIH
 8LVAmJrvfFnKiuZA/gyJj6cmzvP6tzNHtprkmpNaiO7nmmnccsA8heza4pC/pdcM
 CQtj7XFDbxeyjy+hAXrLc4hJAyDGokdWjHGgacFBoSvlOUOqtgi9KtHkuZuFABWI
 U9lOkdgC/lWEwCLF3zIWmbod6c9AiyRcyrlI76l4iI0EkZ+ommEZpZyaL3W4SCPs
 dOHe1TYaQpXfGVp3sBzQwoS9CMbHSrDpL4kM2f+2Byj3HNYLoFGpcHZG1s35kete
 zJuCAUfD+AhzzPBIWCG4uOj7h0rU2+yeBXh+ezMKsCOOx40SltfmNBWEUe8LUq9Z
 Z2hY2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42gnj4frmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 17:05:35 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 46A1740044;
 Tue, 29 Oct 2024 17:04:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E12B726D0B1;
 Tue, 29 Oct 2024 17:02:45 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 29 Oct
 2024 17:02:45 +0100
Message-ID: <a4bf6356-700f-4646-9867-ade436341812@foss.st.com>
Date: Tue, 29 Oct 2024 17:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
References: <20240827140455.345086-1-valentin.caron@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240827140455.345086-1-valentin.caron@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/9] ARM: dts: st: add WLAN/BT on disco
	boards
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

Hi Valentin

On 8/27/24 16:04, Valentin Caron wrote:
> This series enable WLAN/BT module on stm32mp1x discovery boards.
> Use LSCO from RTC to supply 32kHz clock to WLAN/BT modules.
> This is done by selecting "rtc_lsco_pins_a" in the WLAN pinctrl node.
> 
> And also add RTC nodes on stm32mp25x to enable RTC on stm32mp257f-ev1
> board.
> 
> Christophe Roullier (2):
>    ARM: dts: stm32: add support of WLAN/BT on stm32mp157c-dk2
>    ARM: dts: stm32: add support of WLAN/BT on stm32mp135f-dk
> 
> Valentin Caron (7):
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp15
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp13
>    ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp157c-dk2
>    ARM: dts: stm32: rtc, add LSCO to WLAN/BT module on stm32mp135f-dk
>    arm64: dts: st: add RTC on stm32mp25x
>    arm64: dts: st: enable RTC on stm32mp257f-ev1 board
>    ARM: dts: stm32: rtc, add pin to provide LSCO on stm32mp25
> 
>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi   |  7 +++
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 52 +++++++++++++++++++
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   |  7 +++
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 51 +++++++++++++++++-
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  6 +++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 10 ++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  4 ++
>   7 files changed, 136 insertions(+), 1 deletion(-)
> 

I applied the series by removing patch[9] as it raised a build issue.
Furthermore, the pin pin configuration in patch [9] was not used in a 
board, so no need to take it.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
