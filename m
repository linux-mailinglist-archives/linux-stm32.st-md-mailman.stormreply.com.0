Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337FABD25B
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 10:52:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C4BBC78F9B;
	Tue, 20 May 2025 08:52:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB363C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 08:52:38 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K5nKFo003415;
 Tue, 20 May 2025 10:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qXEo/UrIkGCwUrlFozHzuYP47TLSy+9BFxO8UXHRiS0=; b=xYlOKwHuL1ZgDVwh
 FNEeusm/eqTYERP2Y/YJk6M5jl38EMeKOQ0Nafgl68Ni7O650FDcSk2+YiizrXY/
 FMOCEipNGP847LM5w0Aroy4tAHdSECl5HFt7duJovBokGi2fCj4psE6Ucs1uNA22
 vHrdF66I/TiZUvTQk23RHJzYXp1Hw3FCOVw+ErtS1DimCaB39Ab/Y/IGcE5J44Ot
 5cm6KTadkByETx7wsGFfptpOnb1l5NJJao/IYIbZZjEBhU4bqTjwd6dWz3ZHJrKc
 zXCgK2aa1ejWu4o/NfT3p7cdRRc8BY3eCkMJY/7M/o5Di3/UaEr0ZCX1rGp9GOpX
 8Q/IxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvkchka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 10:52:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 58CAC40082;
 Tue, 20 May 2025 10:51:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A27B1B373DB;
 Tue, 20 May 2025 10:49:48 +0200 (CEST)
Received: from [192.168.8.15] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 10:49:48 +0200
Message-ID: <cf096db75e9a321ee86eeb1685f4f1f5cb140e4b.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Guenter Roeck <linux@roeck-us.net>, Julius Werner <jwerner@chromium.org>
Date: Tue, 20 May 2025 10:49:46 +0200
In-Reply-To: <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
References: <20250519170055.205544-1-antonio.borneo@foss.st.com>
 <df2124f7-8df9-4fb3-b687-5968805c668a@roeck-us.net>
 <CAODwPW-gEOotp8KGhzk3E11PqF9xdan8dOwxe_SW4txh+uQp=w@mail.gmail.com>
 <2bb28691-def0-4365-98e0-7f53d4d19966@roeck-us.net>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Evan Benn <evanbenn@chromium.org>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] watchdog: arm_smc_wdt: get wdt status
 through SMCWD_GET_TIMELEFT
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCAyMDI1LTA1LTE5IGF0IDE4OjEzIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+
IE9uIDUvMTkvMjUgMTc6MTIsIEp1bGl1cyBXZXJuZXIgd3JvdGU6Cj4gPiBJIGRvbid0IHJlYWxs
eSBrbm93IGFib3V0IHRoZSBpc3N1ZSBHdWVudGVyIG1lbnRpb25lZCwgYnV0IG90aGVyd2lzZSwK
PiA+IGZyb20gdGhlIGRyaXZlcidzIHNpZGUgdGhpcyBsb29rcyBnb29kIHRvIG1lLgo+ID4gCj4g
Cj4gSXQgc2hvdWxkIGp1c3QgYmUKPiDCoMKgwqDCoMKgwqDCoMKgc2V0X2JpdChXRE9HX0hXX1JV
Tk5JTkcsICZ3ZGQtPnN0YXR1cyk7Cj4gCj4gVGhlcmUgc2hvdWxkIGJlIG5vIGRlcGVuZGVuY3kg
b24gQ09ORklHX1dBVENIRE9HX0hBTkRMRV9CT09UX0VOQUJMRUQuCj4gCj4gR3VlbnRlcgo+IAoK
VGhhbmtzIGZvciB0aGUgcmV2aWV3IQpJIGFncmVlIG9uIEd1ZW50ZXIncyBjb21tZW50IGFuZCBJ
IHdpbGwgc2VuZCBhIFYyIHNob3J0bHkuCgpSZWdhcmRzCkFudG9uaW8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
