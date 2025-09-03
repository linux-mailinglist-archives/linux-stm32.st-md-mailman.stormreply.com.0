Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EACB421DB
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 15:36:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F12C3FAC9;
	Wed,  3 Sep 2025 13:36:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 550EAC3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 13:36:35 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DWqw3022718;
 Wed, 3 Sep 2025 15:36:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bzHn34jeAFC+trUamzDM6dfK6EpwqtxxyQu4NkAXCys=; b=OswDVRc0fkrDCn+U
 jX9Y6JwB7sKv9I9GTRnblCrimf8bCCzaFC3f1b+uFYAEXx6/574guT5BrAlfqg1T
 PrWMo7cxoxMAkTaiYjUpKBkHTr3sfMklY/xnyHXWZyfGvPD5YTYsSuSyEZCRLqRw
 I5zHZ507T90b1NGGwQSvuo5slo6I7Q/q9a7UgHQS24fchqokjpK66XnlEmg7UyyL
 eG8m6eKen77x59fEljxL5h50lzGd+MZ2LXqtLAhaz5FekOi8b8KxAZZyyWPja/tD
 reaKyH3dlFCXRvxHAQYTHdLWJ0nq3v9hOXTHThTsGo1C/QUXCp66FCoIvJ9p/fuB
 NFd1tw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48vav2q0p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 15:36:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA26D40049;
 Wed,  3 Sep 2025 15:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6162A2B4B41;
 Wed,  3 Sep 2025 15:34:53 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 15:34:52 +0200
Message-ID: <9cfa9cb4-bf7e-4d48-b0cc-0726784b7462@foss.st.com>
Date: Wed, 3 Sep 2025 15:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250903-mp2_ethernet-v1-0-4105b0ad2344@foss.st.com>
 <20250903-mp2_ethernet-v1-2-4105b0ad2344@foss.st.com>
 <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <5c49e94a-9267-459a-ba6c-70f3763f1a7b@lunn.ch>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] arm64: dts: st: enable ethernet1
 controller on stm32mp257f-dk
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



On 9/3/25 14:21, Andrew Lunn wrote:
>> +&ethernet1 {
>> +	pinctrl-0 = <&eth1_rgmii_pins_b>;
>> +	pinctrl-1 = <&eth1_rgmii_sleep_pins_b>;
>> +	pinctrl-names = "default", "sleep";
>> +	max-speed = <1000>;
> 
> RGMII naturally has a max-speed of 1G, so this line is pointless.
> 
> You only use max-speed when you need to restrict the system below what
> it would normally use, for example if the PCB is badly designed and
> the tracks don't support 1G, but can do 100Mbps
> 
> 	Andrew

Right, I'll simply remove these lines.

Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
