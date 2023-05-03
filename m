Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67C6F5662
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 12:42:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D60ABC6A60C;
	Wed,  3 May 2023 10:42:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2902CC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 10:42:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso30983055e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 03:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683110522; x=1685702522;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
 b=uiHf7zU5OUclCL+nTNOzI51TiwU3XSMeDr4dH1jtzuJPzyrZsj2smb8gGZc0fqnV7x
 aHL1ofrmje1EDO+5gE0g6qKZ4EuW1aNNu5hqEHzlOnNFJg3dDUsEcnArL7QMqULeZ8QQ
 E78qfLE8YanRXWvr8VWZpJQWQZOP2OfsmOtFdKslaSwhg/W729dCGq8oA9CpVleD+Sf3
 qiwZnpKbCFJljnSJxR0hduidKNBpkgr+9ArXsLE1YdQrUZ5g0UtoCp+WQoSG9oLApN1q
 lpLnom5qusxbymkaYi2fPjD77aDN/15+0Ca22+r2BlmDKzsK4Ofi9VnpgXo/JmVv3006
 rcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683110522; x=1685702522;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDk/+beT2Vi+sTgcaduCKGPnBsodi2tO/SNsvbOgP+Y=;
 b=YCj4ur3iyjVDWDx/0P0Yp7vemB1/qBK15om/UZFts5wmYcpQO3OLFvzDayta183W1X
 QySHBM8LnZngOtoVMFFUj8K3AN/O0gkqI70BfypaXYuqOVoIXUtlqYlU3S5zcD13GkY4
 y5z7kg+4AdCxvF9VH/Kp1HgPSw0ZiNAtn9Wi4fHq1yAi1wUO24wQ4+UpGvxCP1S4iWap
 6qd0gJ2VFrsgybioF4Lpp6l4+cTqw/tXOAlzQdLP1zzDB0zB5advSF5H7AeelMsuX0An
 3uuTCXf82EsBma7YhkkUPDeprUNJnDL+k5fE0OZOgwuFGOwPqs6p+i1A5j2prUvWFsnR
 3b5A==
X-Gm-Message-State: AC+VfDzUfBRkYyJBI2Puwvxys7zKz1vg2QzF/lCdxzq8f756IK0VaI0x
 1AdySEAeiR8Y+XVnb+HrZeydgQ==
X-Google-Smtp-Source: ACHHUZ4+w/861P1TP8XCtb+nKXdXmZXNl4DkJQUk42yYWgf1yqlqtWDrqllYUzBQocFIkyK2KHDH1w==
X-Received: by 2002:a7b:c391:0:b0:3f1:9391:46c with SMTP id
 s17-20020a7bc391000000b003f19391046cmr14791096wmj.30.1683110522481; 
 Wed, 03 May 2023 03:42:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:68:e58d:3e87:f8c2?
 ([2a01:e0a:982:cbb0:68:e58d:3e87:f8c2])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a7bc053000000b003f09d7b6e20sm1512696wmc.2.2023.05.03.03.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:42:02 -0700 (PDT)
Message-ID: <10572b4a-c3dc-6a28-bb21-c8a95444886e@linaro.org>
Date: Wed, 3 May 2023 12:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <AEB0917D-37B0-428B-8FF5-90125BBA7D18@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMDMvMDUvMjAyMyAwMDowMSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPiAKPj4gT24g
MiBNYXkgMjAyMywgYXQgODo0MCBwbSwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgMzoxNeKAr0FNIEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Pj4KPj4+IE9uIFR1ZSwgQXByIDI1LCAyMDIzLCBh
dCAxNzo1NywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4gT24gVHVlLCBBcHIgMjUsIDIwMjMgYXQg
MjoyOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4+IERvZXMgeW91ciBzY3JpcHQgYWxzbyBjYXRlciBmb3IgLmR0cyBmaWxlcyBu
b3QgbWF0Y2hpbmcgYW55IHBhdHRlcm4sCj4+Pj4+IGJ1dCBpbmNsdWRpbmcgYSAuZHRzaSBmaWxl
IHRoYXQgZG9lcyBtYXRjaCBhIHBhdHRlcm4/Cj4+Pj4KPj4+PiBJIGFzc3VtZSBJIGJ1aWx0IGV2
ZXJ5dGhpbmcgYWZ0ZXIgbW92aW5nLCBidXQgbWF5YmUgbm90Li4uCj4+Pj4KPj4+PiBUaGF0J3Mg
YWxsIGp1c3QgImRldGFpbHMiLiBGaXJzdCwgd2UgbmVlZCBhZ3JlZW1lbnQgb24gYSkgbW92aW5n
Cj4+Pj4gdGhpbmdzIHRvIHN1YmRpcnMgYW5kIGIpIGRvaW5nIGl0IDEtYnktMSBvciBhbGwgYXQg
b25jZS4gU28gZmFyIHdlJ3ZlCj4+Pj4gYmVlbiBzdHVjayBvbiBhKSBmb3IgYmVpbmcgJ3RvbyBt
dWNoIGNodXJuJy4KPj4+Cj4+PiBTb3JyeSBmb3IgbWlzc2luZyBtb3N0IG9mIHRoZSBkaXNjdXNz
aW9uIGxhc3Qgd2Vlay4gVGhlIHNjcmlwdCBzb3VuZHMKPj4+IGZpbmUgdG8gbWUsIHRoZSBvbmx5
IHJlYXNvbiBJIGRpZG4ndCB3YW50IHRvIGRvIHRoaXMgaW4gdGhlIHBhc3QgaXMgdGhhdAo+Pj4g
d2UgaGFkIHRoZSBwbGFuIHRvIG1vdmUgcGxhdGZvcm1zIG91dCBvZiB0aGUga2VybmVsIHRyZWUg
dG8gYW4gZXh0ZXJuYWwKPj4+IHJlcG9zaXRvcnkgYW5kIEkgd2FudGVkIHRvIGRvIHRoaXMgcGxh
dGZvcm0gYXQgYSB0aW1lIGFuZCBhbHNvIG9ubHkgbW92ZQo+Pj4gZWFjaCBvbmUgb25jZS4gSSBk
b24ndCB0aGluayB0aGF0IGlzIGdvaW5nIHRvIGhhcHBlbiBhbnl0aW1lIHNvb24gbm93LAo+Pj4g
c28gbGV0J3MganVzdCBkbyB5b3VyIHNjcmlwdC4KPj4+Cj4+PiBDYW4geW91IHNlbmQgbWUgdGhl
IHNjcmlwdCBhbmQvb3IgYSBwdWxsIHJlcXVlc3Qgb2YgdGhlIHJlc3VsdGluZwo+Pj4gdHJlZSBi
YXNlZCBvbiBteSBzb2MvZHQgYnJhbmNoPyBFdmVyeXRoaW5nIGlzIG1lcmdlZCB1cHN0cmVhbSwK
Pj4+IGFuZCBJIHRoaW5rIGdpdC1tZXJnZSB3b3VsZCBoYW5kbGUgdGhlIHJlbWFpbmluZyBtZXJn
ZXMgd2l0aCBhbnkKPj4+IG90aGVyIGNoYW5nZXMgaW4gbWFpbmxpbmUuCj4+Cj4+IEkndmUgZHVz
dGVkIG9mZiBteSBzY3JpcHQgYW5kIG1hZGUgYSBicmFuY2hbMV0gd2l0aCB0aGUgcmVzdWx0Lgo+
PiBUaGVyZSdzIGp1c3QgYSBjb3VwbGUgb2YgZml4ZXMgbmVlZGVkIGFmdGVyIHRoZSBzY3JpcHQg
aXMgcnVuIChzZWUgdGhlCj4+IHRvcCBjb21taXQpLiBUaGUgY3Jvc3MgYXJjaCBpbmNsdWRlcyBh
cmUgYWxsIGZpeGVkIHVwIGJ5IHRoZSBzY3JpcHQuCj4+IGR0YnNfaW5zdGFsbCBtYWludGFpbnMg
YSBmbGF0IGluc3RhbGwuIEkgY29tcGFyZWQgdGhlIG51bWJlciBvZiAuZHRicwo+PiBiZWZvcmUg
YW5kIGFmdGVyIHRvIGNoZWNrIHRoZSBzY3JpcHQuCj4+Cj4+IEkgdGhpbmsgdGhlIG9ubHkgaXNz
dWUgcmVtYWluaW5nIGlzIGZpbmFsaXppbmcgdGhlIG1hcHBpbmcgb2YKPj4gcGxhdGZvcm1zIHRv
IHN1YmRpcnMuIFdoYXQgSSBoYXZlIGN1cnJlbnRseSBpcyBhIG1peHR1cmUgb2YgU29DCj4+IGZh
bWlsaWVzIGFuZCB2ZW5kb3JzLiBUaGUgbW9zdCBub3RhYmxlIGFyZSBhbGwgdGhlIEZyZWVzY2Fs
ZS9OWFAKPj4gcGxhdGZvcm1zLCBweGEsIHNvY2ZwZ2EsIGFuZCBzdG0zMi4gSXQncyBub3QgY29u
c2lzdGVudCB3aXRoIGFybTY0Cj4+IGVpdGhlci4gT25jZSB0aGF0J3MgZmluYWxpemVkLCBJIHN0
aWxsIG5lZWQgdG8gZ28gdXBkYXRlIE1BSU5UQUlORVJTLgo+Pgo+PiBIZXJlJ3MgdGhlIGN1cnJl
bnQgbWFwcGluZzoKPj4KPj4gdmVuZG9yX21hcCA9IHsKPj4gICAgICdhbHBoYXNjYWxlJyA6ICdh
bHBoYXNjYWxlJywKPj4gICAgICdhbHBpbmUnIDogJ2FscGluZScsCj4+ICAgICAnYXJ0cGVjJyA6
ICdheGlzJywKPj4gICAgICdheG0nIDogJ2xzaScsCj4+ICAgICAnY3g5JyA6ICdjbnh0JywKPj4g
ICAgICdlY3gnIDogJ2NhbHhlZGEnLAo+PiAgICAgJ2hpZ2hiYW5rJyA6ICdjYWx4ZWRhJywKPj4g
ICAgICdlcDcnIDogJ2NpcnJ1cycsCj4+ICAgICAnbXhzJzogJ214cycsCj4+ICAgICAnaW14MjMn
OiAnbXhzJywKPj4gICAgICdpbXgyOCc6ICdteHMnLAo+PiAgICAgJ3N1bicgOiAnYWxsd2lubmVy
JywKPj4gICAgICdpbXgnOiAnaW14JywKPj4gICAgICdlNicgOiAnaW14JywKPj4gICAgICdlNycg
OiAnaW14JywKPj4gICAgICdtYmE2JyA6ICdpbXgnLAo+PiAgICAgJ2xzJzogJ2ZzbCcsCj4+ICAg
ICAndmYnOiAnZnNsJywKPj4gICAgICdxY29tJzogJ3Fjb20nLAo+PiAgICAgJ2FtMycgOiAndGkn
LAo+PiAgICAgJ2FtNCcgOiAndGknLAo+PiAgICAgJ2FtNScgOiAndGknLAo+PiAgICAgJ2RyYScg
OiAndGknLAo+PiAgICAgJ2tleXN0b25lJyA6ICd0aScsCj4+ICAgICAnb21hcCcgOiAndGknLAo+
PiAgICAgJ2NvbXB1bGFiJyA6ICd0aScsCj4+ICAgICAnbG9naWNwZCcgOiAndGknLAo+PiAgICAg
J2VscGlkYScgOiAndGknLAo+PiAgICAgJ21vdG9yb2xhJyA6ICd0aScsCj4+ICAgICAndHdsJyA6
ICd0aScsCj4+ICAgICAnZGEnIDogJ3RpJywKPj4gICAgICdkbScgOiAndGknLAo+PiAgICAgJ25z
cGlyZScgOiAnbnNwaXJlJywKPj4gICAgICdhcm1hZGEnIDogJ21hcnZlbGwnLAo+PiAgICAgJ2Rv
dmUnIDogJ21hcnZlbGwnLAo+PiAgICAgJ2tpcmt3b29kJyA6ICdtYXJ2ZWxsJywKPj4gICAgICdv
cmlvbicgOiAnbWFydmVsbCcsCj4+ICAgICAnbXZlYnUnIDogJ21hcnZlbGwnLAo+PiAgICAgJ21t
cCcgOiAnbWFydmVsbCcsCj4+ICAgICAnYmVybGluJyA6ICdiZXJsaW4nLAo+PiAgICAgJ3B4YTIn
IDogJ3B4YScsCj4+ICAgICAncHhhMycgOiAncHhhJywKPj4gICAgICdweGEnIDogJ21hcnZlbGwn
LAo+PiAgICAgJ2FybS0nIDogJ2FybScsCj4+ICAgICAnaW50ZWcnIDogJ2FybScsCj4+ICAgICAn
bXBzJyA6ICdhcm0nLAo+PiAgICAgJ3ZlJyA6ICdhcm0nLAo+PiAgICAgJ2FzcGVlZCcgOiAnYXNw
ZWVkJywKPj4gICAgICdhc3QyJyA6ICdhc3BlZWQnLAo+PiAgICAgJ2ZhY2Vib29rJyA6ICdhc3Bl
ZWQnLAo+PiAgICAgJ2libScgOiAnYXNwZWVkJywKPj4gICAgICdvcGVuYm1jJyA6ICdhc3BlZWQn
LAo+PiAgICAgJ2VuNycgOiAnYWlyb2hhJywKPj4gICAgICdhdDkxJyA6ICdtaWNyb2NoaXAnLAo+
PiAgICAgJ3NhbWEnIDogJ21pY3JvY2hpcCcsCj4+ICAgICAnc2FtOScgOiAnbWljcm9jaGlwJywK
Pj4gICAgICd1c2JfJyA6ICdtaWNyb2NoaXAnLAo+PiAgICAgJ3RueV8nIDogJ21pY3JvY2hpcCcs
Cj4+ICAgICAnbXBhMTYwMCcgOiAnbWljcm9jaGlwJywKPj4gICAgICdhbmltZW9faXAnIDogJ21p
Y3JvY2hpcCcsCj4+ICAgICAnYWtzLWNkdScgOiAnbWljcm9jaGlwJywKPj4gICAgICdldGhlcm51
dDUnIDogJ21pY3JvY2hpcCcsCj4+ICAgICAnZXZrLXBybzMnIDogJ21pY3JvY2hpcCcsCj4+ICAg
ICAncG05ZzQ1JyA6ICdtaWNyb2NoaXAnLAo+PiAgICAgJ2dlODYnIDogJ21pY3JvY2hpcCcsCj4+
ICAgICAnYmNtJyA6ICdicmNtJywKPj4gICAgICdleHlub3MnIDogJ3NhbXN1bmcnLAo+PiAgICAg
J3MzYycgOiAnc2Ftc3VuZycsCj4+ICAgICAnczVwJyA6ICdzYW1zdW5nJywKPj4gICAgICdnZW1p
bmknIDogJ2dlbWluaScsCj4+ICAgICAnaGkzJyA6ICdoaXNpbGljb24nLAo+PiAgICAgJ2hpcCcg
OiAnaGlzaWxpY29uJywKPj4gICAgICdoaXNpJyA6ICdoaXNpbGljb24nLAo+PiAgICAgJ3NkNScg
OiAnaGlzaWxpY29uJywKPj4gICAgICdocGUnIDogJ2hwZScsCj4+ICAgICAnaW50ZWwnOiAnaW50
ZWwnLAo+PiAgICAgJ210JyA6ICdtZWRpYXRlaycsCj4+ICAgICAnbWVzb24nIDogJ21lc29uJywK
PiAKPiDigJhtZXNvbuKAmSA6IOKAmGFtbG9naWPigJksCj4gCj4gXiB0byBtYXRjaCB0aGUgU29D
IHZlbmRvciBuYW1lIChhbmQgYXJtNjQpCgpBY2sgd2UncmUgdHJ5aW5nIHRvIGdldCByaWQgb2Yg
bWVzb24sIHNvIGl0IHdvdWxkIGJlIHRpbWUuCgpOZWlsCgo+IAo+IENocmlzdGlhbgo+IAo+PiAg
ICAgJ21veGEnIDogJ21veGEnLAo+PiAgICAgJ21zdGFyJyA6ICdtc3RhcicsCj4+ICAgICAnbnV2
bycgOiAnbnV2b3RvbicsCj4+ICAgICAnbHBjJyA6ICdscGMnLAo+PiAgICAgJ2xhbjk2JyA6ICdt
aWNyb2NoaXAnLAo+PiAgICAgJ293bCcgOiAnYWN0aW9ucycsCj4+ICAgICAnb3g4JyA6ICdveHNl
bWknLAo+PiAgICAgJ3JkYScgOiAncmRhJywKPj4gICAgICdydGQnIDogJ3JlYWx0ZWsnLAo+PiAg
ICAgJ3I3JyA6ICdyZW5lc2FzJywKPj4gICAgICdyOCcgOiAncmVuZXNhcycsCj4+ICAgICAncjkn
IDogJ3JlbmVzYXMnLAo+PiAgICAgJ2VtZXYyJyA6ICdyZW5lc2FzJywKPj4gICAgICdzaDczYScg
OiAncmVuZXNhcycsCj4+ICAgICAnZ3ItJyA6ICdyZW5lc2FzJywKPj4gICAgICdpd2cnIDogJ3Jl
bmVzYXMnLAo+PiAgICAgJ3JrJyA6ICdyb2NrY2hpcCcsCj4+ICAgICAncnYxMScgOiAncm9ja2No
aXAnLAo+PiAgICAgJ3JvY2tjaGlwJyA6ICdyb2NrY2hpcCcsCj4+ICAgICAnc29jZnBnYScgOiAn
c29jZnBnYScsCj4+ICAgICAnc3RtJyA6ICdzdG0zMicsCj4+ICAgICAnc3RpJyA6ICdzdGknLAo+
PiAgICAgJ3N0LXBpbicgOiAnc3RpJywKPj4gICAgICdzdGUnIDogJ3N0LWVyaWNzc29uJywKPj4g
ICAgICdzcGVhcicgOiAnc3BlYXInLAo+PiAgICAgJ2F4cCcgOiAnYWxsd2lubmVyJywKPj4gICAg
ICd0ZWdyYScgOiAnbnZpZGlhJywKPj4gICAgICdtaWxiZWF1dCcgOiAnc29jaW9uZXh0JywKPj4g
ICAgICd1bmlwaCcgOiAnc29jaW9uZXh0JywKPj4gICAgICd2dDg1MDAnIDogJ3Z0ODUwMCcsCj4+
ICAgICAnd204JyA6ICd2dDg1MDAnLAo+PiAgICAgJ3hlbicgOiAneGVuJywKPj4gICAgICd6eCcg
OiAnenRlJywKPj4gICAgICd6eW5xJyA6ICd4aWxpbngnLAo+PiB9Cj4+Cj4+IFJvYgo+Pgo+PiBb
MV0gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3JvYmgvbGlu
dXguZ2l0IGFybS1kdHMtbW92ZS12Mgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+PiBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
