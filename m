Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B935A10416
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 11:30:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7FF4C7802D;
	Tue, 14 Jan 2025 10:30:07 +0000 (UTC)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [91.218.175.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37715C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:30:00 +0000 (UTC)
Message-ID: <52dab677-6ec9-4ae2-803f-1a2a34c32007@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736850599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GA/Tg/7baXnKm3SwQ55FP1056nxIRWPWVHxeGnzfrOw=;
 b=jwbL0GKCIehF3M3xckD3cBWjbhPRCEMzEavXLyL4y5L/V94tF6HT1FTrRQweF3EOUCan/A
 I0YTwI/haTiPydzelWmoiRk98CTdR5v6/A0FuXJWBHVFOuU12WncAKnqTr1P9VhNwz8t3r
 8yED/ivhpv/jPtwP6yHQnDJynDt7+jw=
Date: Tue, 14 Jan 2025 18:29:47 +0800
MIME-Version: 1.0
To: Paul Menzel <pmenzel@molgen.mpg.de>, Andrew Lunn <andrew@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
 <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
X-Migadu-Flow: FLOW_OUT
Cc: linux-kernel@vger.kernel.org, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

5ZyoIDIwMjUvMS8xNCAxMDoyMSwgUGF1bCBNZW56ZWwg5YaZ6YGTOgo+IERlYXIgQW5kcmV3LAo+
IAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBxdWljayByZXBseS4KPiAKPiAKPiBBbSAxNC4wMS4y
NSB1bSAyMToxNiBzY2hyaWViIEFuZHJldyBMdW5uOgo+Pj4+ICsjZGVmaW5lIE5WVF9NSVNDUl9S
TUlJwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgwKQo+Pj4+ICsKPj4+PiArLyogMjAwMHBzIGlzIG1h
cHBlZCB0byAweDAgfiAweEYgKi8KPj4+Cj4+PiBFeGN1c2UgbXkgaWdub3JhbmNlOiBXaGF0IGlz
IHBzPwo+Pgo+PiBwaWNvc2Vjb25kcy4gQW4gUkdNSUkgbGluayBuZWVkcyBhIDJucyBkZWxheSBi
ZXR3ZWVuIHRoZSBjbG9jayBsaW5lCj4+IGFuZCB0aGUgZGF0YSBsaW5lcy4gU29tZSBNQUNzIGFs
bG93IHlvdSB0byB0dW5lIHRoZSBkZWxheSB0aGV5IGNhbgo+PiBpbnNlcnQsIGluIHRoaXMgY2Fz
ZSBpbiBzdGVwcyBvZiAybnMgLyAxNi4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0
aW9uLiBNYXliZSBpdOKAmXMgbXkgRW5nbGlzaCwgYnV0IEkgZGlkbuKAmXQgCj4gZGVkdWNlIHRo
aXMgZnJvbSBob3cgdGhlIGNvbW1lbnQgaXMgd29yZGVkLiBJIGRvIG5vdCBoYXZlIGEgYmV0dGVy
IGlkZWEgCj4gZWl0aGVyLgoKSG1tbSwgaG93IGFib3V0OgoKMjAwMCBwcyBpcyB4eHh4CgpJIGNo
ZWNrZWQgdGhlIGtlcm5lbCBjb2RlIGFuZCBpdCBsb29rcyBsaWtlCmZvbGtzIHVzdWFsbHkgcHV0
IGEgc3BhY2UgYmV0d2VlbiB0aGUgbnVtYmVyCmFuZCB0aGUgdW5pdC4KCkkgbG9va2VkIGludG8g
dGhlIHJ1bGVzIG9mIGEgYnVuY2ggb2YgcHVibGlzaGVycwphZ2Fpbi4gSXQgc2VlbXMgbGlrZSB0
aGVyZSdzIGEgcnVsZSBhYm91dCBwdXR0aW5nCmEgc3BhY2UgYmV0d2VlbiBhIG51bWJlciBhbmQg
YSB1bml0LCBidXQgd2hlbiB0aGUKdW5pdCBpcyBhIHN5bWJvbCwgdGhhdCdzIGFuIGV4Y2VwdGlv
bjoKCnNwYWNlOgoKMTAga2cKMTAg4oSDCjEwIGgKCm5vIHNwYWNlOgoKMjLCsDM24oCyNDjigLNO
LCAxMTTCsDEw4oCyMTDigLNFCgoKVGhhbmtzLApZYW50ZW5nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
