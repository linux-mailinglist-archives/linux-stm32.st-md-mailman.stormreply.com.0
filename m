Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF43C6F657B
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 09:10:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61566C6A5EE;
	Thu,  4 May 2023 07:10:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C455C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 07:10:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445knZ4015912; Thu, 4 May 2023 09:09:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BdevYqMi76NwKC3zRXAgy5PN3WHuWUsGRFi5mAmNrPU=;
 b=diBkdS5cAS1F6aGRwKb+ZnpjXcLvvpzZASwgoOP/4T8WkojTtCRd77G8y0wSpK265DFf
 5SRXoIc/CY5v7rG7eBolJXEjxs5ZNy928g9ffgPPkIG0/TUSRBSkZ69nPsngOZ/qKR6R
 Dc+Duyu4G38L9DAJuDKUVJ6ZFi6zwRDwUa2XBGJ9YcUUsZ7jKuPAExnDi3F2gWKNlaiV
 lGX9W7eGu6apovH/vVztA94SREXjCBuLXZ1Ef+IcSl/mQmGRz5U83sXo5yh+4sPvoItI
 nXSuhuHXKRPRxWD3ghAGp+VdxBVGEfJFlyDZ2TPVqtOzUXuqFoZcaBR526anQtwoamsn 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qc6uw8hjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 09:09:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DCD5210002A;
 Thu,  4 May 2023 09:09:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0066210F61;
 Thu,  4 May 2023 09:09:15 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 4 May
 2023 09:09:15 +0200
Message-ID: <95076d3b-5667-8cb3-c09a-e0b7dc2b03c3@foss.st.com>
Date: Thu, 4 May 2023 09:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_04,2023-05-03_01,2023-02-09_01
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNS8zLzIzIDEzOjAyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDIsIDIw
MjMsIGF0IDIxOjQwLCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gVHVlLCBNYXkgMiwgMjAyMyBh
dCAzOjE14oCvQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gCgouLi4K
Cj4gCj4+ICAgICAgJ3N0bScgOiAnc3RtMzInLAo+PiAgICAgICdzdGknIDogJ3N0aScsCj4+ICAg
ICAgJ3N0LXBpbicgOiAnc3RpJywKPj4gICAgICAnc3RlJyA6ICdzdC1lcmljc3NvbicsCj4+ICAg
ICAgJ3NwZWFyJyA6ICdzcGVhcicsCj4gCj4gSSB3b3VsZCBwdXQgYWxsIGZpdmUgb2YgdGhlc2Ug
aW50byAnc3QnLiBUaGUgdXg1MDAgd2FzIGRldmVsb3BlZAo+IGluIHN0LWVyaWNzc29uLCBidXQg
bGFzdCBzb2xkIGJ5IHN0LCBhbmQgdGhlIG90aGVyIG9uZXMgYXJlIGFsbAo+IG9yaWdpbmFsIHN0
IHByb2R1Y3RzLgoKQWNrZWQtYnk6IEFsZXhhbmRyZSBUT1JHVUUgPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPgoKdGhhbmtzCkFsZXgKCj4gCj4gICAgICAgIEFybmQKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dAo+IExpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
