Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31A6F6148
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 00:30:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B076AC69073;
	Wed,  3 May 2023 22:30:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85BF5C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 22:30:13 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-24de2954bc5so3655696a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 15:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683153012; x=1685745012;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
 b=bNRlnnTF+SjZJvfO0HArhda1ki6KEyIa7yIRZQPDhMmTqTNNooLEQemu27nE0HCTDC
 ehg0UFT/VFvJrzxIMMpqs/LfyiZTcvfm3F+XeRCHeLKiHGTslEamAcA/igyUj1RUpYqb
 jGTv1DRSnyHXSO+6BklV+H0tQUegWEpRcj9ZpU3IZeJyr0OTp0uWflXKxNLt/Dv3Fo9Q
 lyreFoA/HC5oPSx7g0RJgiSEs9GwL3CQmot20cPJQBMw9eDNFCnNWmZeSQ/ZfOgd+UUX
 wLIk2ukG1JzFJdW7nk5OX9lr2jX57mY836CjkAxfeHIEUZ2uly4MzKA0lNXFe8yznUDm
 6rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683153012; x=1685745012;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Mp6CzPotn9aMhYuP1SiSdnM3toCuetUTL6p1Pka30U=;
 b=c67012VK6XZ2ZxJOauDHj9njO8ZCT5D02iE4tCOV80X+rh4Nt0J7dtQr1W/kB8/zru
 zoufnIzL7SzsPLJO8Wss+Y3MOKDelQiEgwPlIoVSMmZ7c0oNlPEsGz56D58O6AHrsymS
 hORSh2djk1uCwY0nG/5rGMap3oKHS1xJxZJRrLfgwbH8ygqCIDharhK8poUiogJ9ye6U
 kqspO1fJhFNLuO2wZO9YCAOdcKnIPjrgmhPPmuAAPfPxptuNJhKaEqTCQD2Uzzkm5B1f
 nlP41c0e1Q6fjsj4iWJQ4bYtR1TfACIKGQRc4grnNEmwQMQpq7lokK6+rgazIgyDPPoS
 uImA==
X-Gm-Message-State: AC+VfDyDC/97M+m8TWLp08OJl2xC8+4RHPnxL/zSiF1cc7ZcuDAiU+Re
 GOhl6a5IR+Q9Coa47ckJ5GU=
X-Google-Smtp-Source: ACHHUZ68cmsHxtB87iONW+SsuMsSJr4NkMfMrRrxl8kzW+7lj28j0Q7Ue/XhdACq9ZdVdGd7yUEu7w==
X-Received: by 2002:a17:90a:a891:b0:247:bdd3:a039 with SMTP id
 h17-20020a17090aa89100b00247bdd3a039mr172899pjq.8.1683153011868; 
 Wed, 03 May 2023 15:30:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 jx12-20020a17090b46cc00b0024e0141353dsm1872551pjb.28.2023.05.03.15.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 15:30:11 -0700 (PDT)
Message-ID: <bae5336c-a26a-cabb-6b83-ee9cece18130@gmail.com>
Date: Wed, 3 May 2023 15:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <d4b52074-d11c-4c7a-ad74-b2fce64c6d30@gmail.com>
 <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAL_JsqKRcMSijAdiP_BpyBGRuMhscZ12QFcLBAeZ+TcaQg7r4g@mail.gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
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

T24gNS8yLzIzIDE4OjA0LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUdWUsIE1heSAyLCAyMDIz
IGF0IDY6MDLigK9QTSBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIDUvMi8yMyAxMjo0MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBUdWUs
IE1heSAyLCAyMDIzIGF0IDM6MTXigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4+Pgo+Pj4+IE9uIFR1ZSwgQXByIDI1LCAyMDIzLCBhdCAxNzo1NywgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4+Pj4+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDI6MjjigK9BTSBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPj4+Pj4KPj4+Pj4+IERv
ZXMgeW91ciBzY3JpcHQgYWxzbyBjYXRlciBmb3IgLmR0cyBmaWxlcyBub3QgbWF0Y2hpbmcgYW55
IHBhdHRlcm4sCj4+Pj4+PiBidXQgaW5jbHVkaW5nIGEgLmR0c2kgZmlsZSB0aGF0IGRvZXMgbWF0
Y2ggYSBwYXR0ZXJuPwo+Pj4+Pgo+Pj4+PiBJIGFzc3VtZSBJIGJ1aWx0IGV2ZXJ5dGhpbmcgYWZ0
ZXIgbW92aW5nLCBidXQgbWF5YmUgbm90Li4uCj4+Pj4+Cj4+Pj4+IFRoYXQncyBhbGwganVzdCAi
ZGV0YWlscyIuIEZpcnN0LCB3ZSBuZWVkIGFncmVlbWVudCBvbiBhKSBtb3ZpbmcKPj4+Pj4gdGhp
bmdzIHRvIHN1YmRpcnMgYW5kIGIpIGRvaW5nIGl0IDEtYnktMSBvciBhbGwgYXQgb25jZS4gU28g
ZmFyIHdlJ3ZlCj4+Pj4+IGJlZW4gc3R1Y2sgb24gYSkgZm9yIGJlaW5nICd0b28gbXVjaCBjaHVy
bicuCj4+Pj4KPj4+PiBTb3JyeSBmb3IgbWlzc2luZyBtb3N0IG9mIHRoZSBkaXNjdXNzaW9uIGxh
c3Qgd2Vlay4gVGhlIHNjcmlwdCBzb3VuZHMKPj4+PiBmaW5lIHRvIG1lLCB0aGUgb25seSByZWFz
b24gSSBkaWRuJ3Qgd2FudCB0byBkbyB0aGlzIGluIHRoZSBwYXN0IGlzIHRoYXQKPj4+PiB3ZSBo
YWQgdGhlIHBsYW4gdG8gbW92ZSBwbGF0Zm9ybXMgb3V0IG9mIHRoZSBrZXJuZWwgdHJlZSB0byBh
biBleHRlcm5hbAo+Pj4+IHJlcG9zaXRvcnkgYW5kIEkgd2FudGVkIHRvIGRvIHRoaXMgcGxhdGZv
cm0gYXQgYSB0aW1lIGFuZCBhbHNvIG9ubHkgbW92ZQo+Pj4+IGVhY2ggb25lIG9uY2UuIEkgZG9u
J3QgdGhpbmsgdGhhdCBpcyBnb2luZyB0byBoYXBwZW4gYW55dGltZSBzb29uIG5vdywKPj4+PiBz
byBsZXQncyBqdXN0IGRvIHlvdXIgc2NyaXB0Lgo+Pj4+Cj4+Pj4gQ2FuIHlvdSBzZW5kIG1lIHRo
ZSBzY3JpcHQgYW5kL29yIGEgcHVsbCByZXF1ZXN0IG9mIHRoZSByZXN1bHRpbmcKPj4+PiB0cmVl
IGJhc2VkIG9uIG15IHNvYy9kdCBicmFuY2g/IEV2ZXJ5dGhpbmcgaXMgbWVyZ2VkIHVwc3RyZWFt
LAo+Pj4+IGFuZCBJIHRoaW5rIGdpdC1tZXJnZSB3b3VsZCBoYW5kbGUgdGhlIHJlbWFpbmluZyBt
ZXJnZXMgd2l0aCBhbnkKPj4+PiBvdGhlciBjaGFuZ2VzIGluIG1haW5saW5lLgo+Pj4KPj4+IEkn
dmUgZHVzdGVkIG9mZiBteSBzY3JpcHQgYW5kIG1hZGUgYSBicmFuY2hbMV0gd2l0aCB0aGUgcmVz
dWx0Lgo+Pj4gVGhlcmUncyBqdXN0IGEgY291cGxlIG9mIGZpeGVzIG5lZWRlZCBhZnRlciB0aGUg
c2NyaXB0IGlzIHJ1biAoc2VlIHRoZQo+Pj4gdG9wIGNvbW1pdCkuIFRoZSBjcm9zcyBhcmNoIGlu
Y2x1ZGVzIGFyZSBhbGwgZml4ZWQgdXAgYnkgdGhlIHNjcmlwdC4KPj4+IGR0YnNfaW5zdGFsbCBt
YWludGFpbnMgYSBmbGF0IGluc3RhbGwuIEkgY29tcGFyZWQgdGhlIG51bWJlciBvZiAuZHRicwo+
Pj4gYmVmb3JlIGFuZCBhZnRlciB0byBjaGVjayB0aGUgc2NyaXB0Lgo+Pj4KPj4+IEkgdGhpbmsg
dGhlIG9ubHkgaXNzdWUgcmVtYWluaW5nIGlzIGZpbmFsaXppbmcgdGhlIG1hcHBpbmcgb2YKPj4+
IHBsYXRmb3JtcyB0byBzdWJkaXJzLiBXaGF0IEkgaGF2ZSBjdXJyZW50bHkgaXMgYSBtaXh0dXJl
IG9mIFNvQwo+Pj4gZmFtaWxpZXMgYW5kIHZlbmRvcnMuIFRoZSBtb3N0IG5vdGFibGUgYXJlIGFs
bCB0aGUgRnJlZXNjYWxlL05YUAo+Pj4gcGxhdGZvcm1zLCBweGEsIHNvY2ZwZ2EsIGFuZCBzdG0z
Mi4gSXQncyBub3QgY29uc2lzdGVudCB3aXRoIGFybTY0Cj4+PiBlaXRoZXIuIE9uY2UgdGhhdCdz
IGZpbmFsaXplZCwgSSBzdGlsbCBuZWVkIHRvIGdvIHVwZGF0ZSBNQUlOVEFJTkVSUy4KPj4+Cj4+
PiBIZXJlJ3MgdGhlIGN1cnJlbnQgbWFwcGluZzoKPj4+Cj4+PiB2ZW5kb3JfbWFwID0gewo+Pj4g
ICAgICAgJ2FscGhhc2NhbGUnIDogJ2FscGhhc2NhbGUnLAo+Pj4gICAgICAgJ2FscGluZScgOiAn
YWxwaW5lJywKPj4+ICAgICAgICdhcnRwZWMnIDogJ2F4aXMnLAo+Pj4gICAgICAgJ2F4bScgOiAn
bHNpJywKPj4+ICAgICAgICdjeDknIDogJ2NueHQnLAo+Pj4gICAgICAgJ2VjeCcgOiAnY2FseGVk
YScsCj4+PiAgICAgICAnaGlnaGJhbmsnIDogJ2NhbHhlZGEnLAo+Pj4gICAgICAgJ2VwNycgOiAn
Y2lycnVzJywKPj4+ICAgICAgICdteHMnOiAnbXhzJywKPj4+ICAgICAgICdpbXgyMyc6ICdteHMn
LAo+Pj4gICAgICAgJ2lteDI4JzogJ214cycsCj4+PiAgICAgICAnc3VuJyA6ICdhbGx3aW5uZXIn
LAo+Pj4gICAgICAgJ2lteCc6ICdpbXgnLAo+Pj4gICAgICAgJ2U2JyA6ICdpbXgnLAo+Pj4gICAg
ICAgJ2U3JyA6ICdpbXgnLAo+Pj4gICAgICAgJ21iYTYnIDogJ2lteCcsCj4+PiAgICAgICAnbHMn
OiAnZnNsJywKPj4+ICAgICAgICd2Zic6ICdmc2wnLAo+Pj4gICAgICAgJ3Fjb20nOiAncWNvbScs
Cj4+PiAgICAgICAnYW0zJyA6ICd0aScsCj4+PiAgICAgICAnYW00JyA6ICd0aScsCj4+PiAgICAg
ICAnYW01JyA6ICd0aScsCj4+PiAgICAgICAnZHJhJyA6ICd0aScsCj4+PiAgICAgICAna2V5c3Rv
bmUnIDogJ3RpJywKPj4+ICAgICAgICdvbWFwJyA6ICd0aScsCj4+PiAgICAgICAnY29tcHVsYWIn
IDogJ3RpJywKPj4+ICAgICAgICdsb2dpY3BkJyA6ICd0aScsCj4+PiAgICAgICAnZWxwaWRhJyA6
ICd0aScsCj4+PiAgICAgICAnbW90b3JvbGEnIDogJ3RpJywKPj4+ICAgICAgICd0d2wnIDogJ3Rp
JywKPj4+ICAgICAgICdkYScgOiAndGknLAo+Pj4gICAgICAgJ2RtJyA6ICd0aScsCj4+PiAgICAg
ICAnbnNwaXJlJyA6ICduc3BpcmUnLAo+Pj4gICAgICAgJ2FybWFkYScgOiAnbWFydmVsbCcsCj4+
PiAgICAgICAnZG92ZScgOiAnbWFydmVsbCcsCj4+PiAgICAgICAna2lya3dvb2QnIDogJ21hcnZl
bGwnLAo+Pj4gICAgICAgJ29yaW9uJyA6ICdtYXJ2ZWxsJywKPj4+ICAgICAgICdtdmVidScgOiAn
bWFydmVsbCcsCj4+PiAgICAgICAnbW1wJyA6ICdtYXJ2ZWxsJywKPj4+ICAgICAgICdiZXJsaW4n
IDogJ2JlcmxpbicsCj4+PiAgICAgICAncHhhMicgOiAncHhhJywKPj4+ICAgICAgICdweGEzJyA6
ICdweGEnLAo+Pj4gICAgICAgJ3B4YScgOiAnbWFydmVsbCcsCj4+PiAgICAgICAnYXJtLScgOiAn
YXJtJywKPj4+ICAgICAgICdpbnRlZycgOiAnYXJtJywKPj4+ICAgICAgICdtcHMnIDogJ2FybScs
Cj4+PiAgICAgICAndmUnIDogJ2FybScsCj4+PiAgICAgICAnYXNwZWVkJyA6ICdhc3BlZWQnLAo+
Pj4gICAgICAgJ2FzdDInIDogJ2FzcGVlZCcsCj4+PiAgICAgICAnZmFjZWJvb2snIDogJ2FzcGVl
ZCcsCj4+PiAgICAgICAnaWJtJyA6ICdhc3BlZWQnLAo+Pj4gICAgICAgJ29wZW5ibWMnIDogJ2Fz
cGVlZCcsCj4+PiAgICAgICAnZW43JyA6ICdhaXJvaGEnLAo+Pj4gICAgICAgJ2F0OTEnIDogJ21p
Y3JvY2hpcCcsCj4+PiAgICAgICAnc2FtYScgOiAnbWljcm9jaGlwJywKPj4+ICAgICAgICdzYW05
JyA6ICdtaWNyb2NoaXAnLAo+Pj4gICAgICAgJ3VzYl8nIDogJ21pY3JvY2hpcCcsCj4+PiAgICAg
ICAndG55XycgOiAnbWljcm9jaGlwJywKPj4+ICAgICAgICdtcGExNjAwJyA6ICdtaWNyb2NoaXAn
LAo+Pj4gICAgICAgJ2FuaW1lb19pcCcgOiAnbWljcm9jaGlwJywKPj4+ICAgICAgICdha3MtY2R1
JyA6ICdtaWNyb2NoaXAnLAo+Pj4gICAgICAgJ2V0aGVybnV0NScgOiAnbWljcm9jaGlwJywKPj4+
ICAgICAgICdldmstcHJvMycgOiAnbWljcm9jaGlwJywKPj4+ICAgICAgICdwbTlnNDUnIDogJ21p
Y3JvY2hpcCcsCj4+PiAgICAgICAnZ2U4NicgOiAnbWljcm9jaGlwJywKPj4+ICAgICAgICdiY20n
IDogJ2JyY20nLAo+Pgo+PiBIb3cgYWJvdXQgd2UgdXNlICdicm9hZGNvbScgaGVyZSwgdG8gZm9s
bG93IHdoYXQgYXJtNjQgZG9lcz8gSSBjb3VsZAo+PiByZW5hbWUgYXJjaC9taXBzL2Jvb3QvZHRz
L2JyY20gdG8gYXJjaC9taXBzL2Jvb3QvZHRzL2Jyb2FkY29tIGZvcgo+PiBjb25zaXN0ZW5jeSwg
dG9vPwo+IAo+IE9rYXksIHRob3VnaCBpZiBzdGFydGluZyBjbGVhbiBJJ2Qgc29tZXdoYXQgcHJl
ZmVyIHRvIHVzZSB0aGUgdmVuZG9yCj4gcHJlZml4LiBJIGd1ZXNzIHNpbmNlIGFybSBhbmQgYXJt
NjQgc2hhcmUgZHRzaSBmaWxlcywgdGhleSBzaG91bGQKPiBtYXRjaC4KClNvdW5kcyBnb29kIHRv
IG1lLCBsZXQncyBnbyB3aXRoICJicmNtIiB0aGVuLgotLSAKRmxvcmlhbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
