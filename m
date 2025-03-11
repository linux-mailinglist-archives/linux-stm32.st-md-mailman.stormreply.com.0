Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4622A5BAB6
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 09:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C82C78F97;
	Tue, 11 Mar 2025 08:20:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81691C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 08:20:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B81kWr016929;
 Tue, 11 Mar 2025 09:20:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mgvPHrj9w39QFxaBaXFSsD+ID+KMNA0Jvstg1hsdw/Y=; b=0Fjsb0yBbTOx9kv7
 0vWPYYqspDp8ROlPr288Q5Gqu0hCBFOW+w90Q/aT2JRbvXBMEz6ieEzQTaDnciFP
 pwWSQiqbdeJVgXIbaU5xl6cew2PqduOVCnLlNoboEHdwpOcq6bMsoZ0iaGB+iP9t
 VBN+pm9N9ULZLU42297zPLfCLHrjStHtCjfbXBLX/IFXZu+WXUNtkSLtoXT8xwLj
 n/k/cT4y4OBH/zs7KeP1YuCSwulJfRgjdbzJmjFTYYUEMqRkVOTVRn89COBdLFhI
 B396eO+w0acQ7V08h3rewGqZSPYnYUcPqUutv15sMi2k/jjmyX/zRbUwITDFLYej
 D5Bgnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4590b95gfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Mar 2025 09:20:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 37DF040063;
 Tue, 11 Mar 2025 09:18:42 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08650544BDE;
 Tue, 11 Mar 2025 09:16:33 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 09:16:32 +0100
Message-ID: <face80e3-36be-42a0-8d31-bb74e413e397@foss.st.com>
Date: Tue, 11 Mar 2025 09:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250305131425.1491769-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250305131425.1491769-1-o.rempel@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_01,2024-11-22_01
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/4] Add support for Plymovent AQM board
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

Hi Oleksij

On 3/5/25 14:14, Oleksij Rempel wrote:
> This patch series adds support for the Plymovent AQM board based on the
> STM32MP151C SoC. Additionally, the ICS-43432 device tree binding is
> converted to YAML to address a validation warning.
> 
> The ICS-43432 patch resolves one of the devicetree validation warnings.
> However, the false-positive warning:
> 
>    "audio-controller@44004000: port:endpoint: Unevaluated properties are
>     not allowed ('format' was unexpected)"
> 
> remains unresolved. The "format" property is required for proper
> functionality of this device.
> 
> Best regards,
> 
> Oleksij Rempel (4):
>    dt-bindings: sound: convert ICS-43432 binding to YAML
>    dt-bindings: arm: stm32: Add Plymovent AQM board
>    ARM: dts: stm32: Add pinmux groups for Plymovent AQM board
>    arm: dts: stm32: Add Plymovent AQM devicetree
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   1 +
>   .../devicetree/bindings/sound/ics43432.txt    |  19 -
>   .../bindings/sound/invensense,ics43432.yaml   |  51 +++
>   arch/arm/boot/dts/st/Makefile                 |   1 +
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 292 ++++++++++++++
>   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts   | 376 ++++++++++++++++++
>   6 files changed, 721 insertions(+), 19 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/ics43432.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/invensense,ics43432.yaml
>   create mode 100644 arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
> 
> --
> 2.39.5
> 

Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
