Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C9360BCF
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 16:30:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7A7FC57B79;
	Thu, 15 Apr 2021 14:30:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE8DEC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:30:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 31C6B81FD5;
 Thu, 15 Apr 2021 16:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618497045;
 bh=QCFlP+DjDQQ/peWcEBQFC8IoSA2aoys0PklnNs1hhLw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Hg5s2vAe5leyJERNEtnaXGvcHS2i5r2lX942XGx3T7rPZx1Lddv495O0ezzI3YJEe
 274OkqHdDLEBNFVviWcCwoQGQ8Xv2Y/JrM0TNLi8jsC2Tt2fl2/hs0p+l2a4TPHwko
 6Euo2siHp9C6s0HuameFet8tjz0DJsBgk1tEt0tp0JvcLTYPvyj8FPeV95YH7FIfud
 xMazhhb7XSzjBgpYzrN8RHaSY+QYWgHdub6eRo5UB16NVVsgCRSsXLHntW7G0fJvL0
 F54soBKqD3w7kY8+s0dYzbslIVCyO8Y23VkDSJDeiRoBjVsa/HnY9CH7t+8okXEv16
 efWSkQJG/d5QA==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-12-alexandre.torgue@foss.st.com>
 <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
 <36e9f0df-dfdb-e2f5-3d6e-ac32a1b8156e@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <fa3885df-8977-9540-f2af-d4095f519483@denx.de>
Date: Thu, 15 Apr 2021 16:30:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <36e9f0df-dfdb-e2f5-3d6e-ac32a1b8156e@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/13] ARM: dts: stm32: fix LTDC port node
 on STM32 MCU ad MPU
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

T24gNC8xNS8yMSAzOjM0IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
ZWxsbyBBbGV4YW5kcmUsCgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWRrMi5kdHMgCj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5k
dHMKPj4+IGluZGV4IDJiYzkyZWYzYWViOS4uMTllZjQ3NWE0OGZjIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+Pj4gKysrIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+Pj4gQEAgLTgyLDkgKzgyLDE1IEBACj4+PiDC
oCB9Owo+Pj4gwqAgJmx0ZGMgewo+Pj4gLcKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+PiAtCj4+
PiDCoMKgwqDCoMKgIHBvcnQgewo+Pj4gK8KgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+Pj4gKwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUt
ZW5kcG9pbnQgPSA8JnNpaTkwMjJfaW4+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+PiArCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgbHRkY19lcDFfb3V0OiBlbmRwb2ludEAxIHsKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwxPjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX2luPjsKPj4KPj4gWy4uLl0KPj4KPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYu
ZHRzaSAKPj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdlcjk2
LmR0c2kKPj4+IGluZGV4IDY0ZGNhNWI3Zjc0OC4uZTdmMTA5NzVjYWNmIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdlcjk2LmR0c2kKPj4+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNp
Cj4+PiBAQCAtMjc3LDExICsyNzcsNyBAQAo+Pj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7
Cj4+PiDCoMKgwqDCoMKgIHBvcnQgewo+Pj4gLcKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxz
ID0gPDE+Owo+Pj4gLcKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Owo+Pj4gLQo+Pj4g
LcKgwqDCoMKgwqDCoMKgIGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+PiArwqDCoMKgwqDCoMKgwqAgbHRkY19lcDBfb3V0
OiBlbmRwb2ludCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9p
bnQgPSA8JmFkdjc1MTNfaW4+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiDCoMKgwqDC
oMKgIH07Cj4+Cj4+IEkgdGhpbmsgdGhpcyBpcyB3cm9uZywgdGhlIEFWOTYgY2FuIGhhdmUgdHdv
IGRpc3BsYXlzIGNvbm5lY3RlZCB0byB0d28gCj4+IHBvcnRzIG9mIHRoZSBMVERDLCBqdXN0IGxp
a2UgREsyIGZvciBleGFtcGxlLgo+IAo+IEFzIGZvciBkazIgYWRkcmVzcy9zaXplIGNlbGxzIGFy
ZSBhZGRlZCBvbmx5IGlmIHRoZXJlIGFyZSAyIGVuZHBvaW50cy4gCj4gSXQgaXMgZm9yIHRoaXMg
cmVhc29uIEkgbW92ZWQgZW5kcG9pbnQwIGRlZmluaXRpb24gZnJvbSBzdG0zMm1wMTV4eC1ka3gg
Cj4gdG8gc3RtMzJtcDE1MWEtZGsxLmR0cyAoZGsxIGhhcyBvbmx5IG9uZSBlbmRwb2ludCkuCj4g
Cj4gSGVyZSBpdCdzIHRoZSBzYW1lLCBpZiB5b3UgaGF2ZSBzZWNvbmQgZW5kcG9pbnQgdGhlbiBh
ZHJlc3Mvc2l6ZSB3aWxsIAo+IGhhdmUgdG8gYmUgYWRkZWQuCgpUaGF0J3MgYSBiaXQgcHJvYmxl
bWF0aWMuIENvbnNpZGVyIGVpdGhlciB0aGUgdXNlIGNhc2Ugb2YgRFRPIHdoaWNoIGFkZHMgCnRo
ZSBvdGhlciBkaXNwbGF5LCBvciBldmVuIGEgY3VzdG9tIGJvYXJkIERUUy4gV2l0aG91dCB5b3Vy
IHBhdGNoLCB0aGlzIAp3b3JrczoKCmFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29y
LWF2ZW5nZXI5Ni5kdHNpCiZsdGRjIHsKICAgLi4uCiAgIHBvcnRzIHsKICAgICBsdGRjX2VwMF9v
dXQ6IGVuZHBvaW50QDAgewogICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZhZHY3NTEzX2luPjsK
ICAgICB9OwogICB9Owp9OwoKYm9hcmQtd2l0aC1kaXNwbGF5LmR0cyBvciBib2FyZC1vdmVybGF5
LmR0cwombHRkYyB7CiAgIHBvcnRzIHsKICAgICBlbmRwb2ludEAxIHsgLy8ganVzdCBhZGQgYW5v
dGhlciBlbmRwb2ludEAxLCBubyBwcm9ibGVtCiAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRp
c3BsYXk+OwogICAgIH07CiAgIH07Cn07CgpXaXRoIHlvdXIgcGF0Y2gsIHRoZSBEVFMgd291bGQg
aGF2ZSB0byBtb2RpZnkgdGhlICJlbmRwb2ludCIgbm9kZSB0byBiZSAKImVuZHBvaW50QDAiIHBy
b2JhYmx5IHdpdGggYSB3aG9sZSBsb3Qgb2YgL2RldGVsZS1ub2RlLyBldGMuIG1hZ2ljIChEVE8g
CmNhbm5vdCBkbyB0aGF0LCBzbyB0aGF0J3MgYSBwcm9ibGVtLCBhbmQgSSBkbyB1c2UgRFRPcyBv
biBBVjk2IApleHRlbnNpdmVseSBmb3IgdGhlIHZhcmlvdXMgZXhwYW5zaW9uIGNhcmRzKSBhbmQg
dGhlbiBhZGQgdGhlIAplbmRwb2ludEAxLiBUaGF0IGJlY29tZXMgcmVhbCBjb21wbGljYXRlZCBp
biBjdXN0b20gYm9hcmQgRFQsIGFuZCAKaW1wb3NzaWJsZSB3aXRoIERUTy4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
