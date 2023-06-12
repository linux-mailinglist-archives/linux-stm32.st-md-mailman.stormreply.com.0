Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1472C46C
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 14:37:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90B98C6A60E;
	Mon, 12 Jun 2023 12:37:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C28C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 08:26:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C7gpvX010127; Mon, 12 Jun 2023 10:26:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZdSuXdliB6GsADqF1N5hXj4+X7GJHpgFDArdmaQU6eg=;
 b=5rQ0DjHc879WwjcQHfYRtF/lq94Uo8lxx60FZnhoq7RXoWEjkQ+0ROgoqojqd7zCwLet
 fiBjo8LVdl5hPP6NFwhxTblExK7F0kGlc72akqi/QMAqQtKvytesV5EQ/LzgDaFPsCqi
 RMl+m16ZPaPHoXc9/r0OIng65zVRqaIzUJY6WewJgE7hNYtquIxlk0k22DAVdIONOJ5E
 bl8MTSMn7P0tVbqoGmoWi6MZpS7682r8nD+RiJQtSaBshcsLkzpq7vEX5pLst8S37b9G
 SWIpo/JBSVc3gyua9dg7wglVxtuOrg3isENhRca4Xxhmvp9zggizx0ahxRAemG9CDqVz fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r5smd229f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 10:26:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BEBF910002A;
 Mon, 12 Jun 2023 10:26:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94E072194CD;
 Mon, 12 Jun 2023 10:26:06 +0200 (CEST)
Received: from [10.252.14.202] (10.252.14.202) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 12 Jun
 2023 10:26:05 +0200
Message-ID: <c944123c-bcd8-89cf-c2cd-8d5742931f68@foss.st.com>
Date: Mon, 12 Jun 2023 10:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
 <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
 <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <b65288f6-1d3d-424f-5df5-98e86cc51dec@denx.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <b65288f6-1d3d-424f-5df5-98e86cc51dec@denx.de>
X-Originating-IP: [10.252.14.202]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_05,2023-06-09_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 12 Jun 2023 12:37:31 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

CgpPbiA2LzEwLzIzIDE1OjQ2LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzcvMjMgMTE6NTMs
IEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4gCj4gSGksCj4gCj4gWy4uLl0KPiAKPj4+Pj4+Pj4g
UmF0aGVyIHRoYW4gYWRkaW5nIHVudXNlZCBvcHRpb25hbCBtYWlsYm94LCBJIHdpbGwgbW9yZSBp
biBmYXZvcgo+Pj4+Pj4+PiBvZiBoYXZpbmcgYSBtYm94X3JlcXVlc3RfY2hhbm5lbF9ieW5hbWVf
b3B0aW9uYWwgaGVscGVyIG9yCj4+Pj4+Pj4+IHNvbWV0aGluZyBzaW1pbGFyCj4+Pj4+Pj4KPj4+
Pj4+PiBTZWUgYWJvdmUsIEkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIGhhdmUgdGhlIG1haWxib3gg
ZGVzY3JpYmVkIGluIERUCj4+Pj4+Pj4gYWx3YXlzIGFuZCBub3QgdXNlIGl0ICh0aGUgdXNlciBj
YW4gYWx3YXlzIHJlbW92ZSBpdCksIHRoYW4gdG8gbm90Cj4+Pj4+Pj4gaGF2ZSBpdCBkZXNjcmli
ZWQgb24gc29tZSBib2FyZHMgYW5kIGhhdmUgaXQgZGVzY3JpYmVkIG9uIG90aGVyCj4+Pj4+Pj4g
Ym9hcmRzCj4+Pj4+IChpbmNvbnNpc3RlbmN5KS4KPj4+Pj4+Cj4+Pj4+PiBBZGRpbmcgaXQgaW4g
dGhlIERUICggYW5kIGVzcGVjaWFsbHkgaW4gdGhlIFNvYyBEVFNJKSBjYW4gYWxzbyBiZQo+Pj4+
Pj4gaW50ZXJwcmV0ZWQgYXMgIml0IGlzIGRlZmluZWQgc28geW91IG11c3QgdXNlIGl0Ii4gSSB3
b3VsZCBleHBlY3QKPj4+Pj4+IHRoYXQgdGhlIEJpbmRpbmdzIGFscmVhZHkgcHJvdmlkZSB0aGUg
aW5mb3JtYXRpb24gdG8gaGVscCB1c2VyIHRvIGFkZCBpdAo+Pj4gb24gbmVlZC4KPj4+Pj4KPj4+
Pj4gV2h5IHNob3VsZCBldmVyeSBzaW5nbGUgYm9hcmQgYWRkIGl0IHNlcGFyYXRlbHkgYW5kIGR1
cGxpY2F0ZSB0aGUKPj4+Pj4gc2FtZSBzdHVmZiwgaWYgdGhleSBjYW4gYWxsIHN0YXJ0IHdpdGgg
aXQsIGFuZCBpZiBhbnlvbmUgbmVlZHMgdG8KPj4+Pj4gdHdlYWsgdGhlIG1haWxib3ggYWxsb2Nh
dGlvbiwgdGhlbiB0aGV5IGNhbiBkbyB0aGF0IGluIHRoZSBib2FyZCBEVCA/Cj4+Pj4+IEkgcmVh
bGx5IGRvbid0IGxpa2UgdGhlIGR1cGxpY2F0aW9uIHN1Z2dlc3Rpb24gaGVyZS4KPj4+Pgo+Pj4+
IEkgd2FzIHNwZWFraW5nIGFib3V0ICJkZXRhY2ggbWFpbGJveC4gSGVyZSBpcyB3aGF0IEkgd291
bGQgbGlrZSB0bwo+Pj4+IHByb3Bvc2UgdG8geW91Cj4+Pj4KPj4+PiAxKcKgIG1vdmUgYWxsIHRo
ZSBtYWlsYm94IGRlY2xhcmF0aW9uIGluIHRoZSBEVFNJIGV4Y2VwdCAiZGV0YWNoIgo+Pj4+IDIp
IGRvbid0IGRlY2xhcmUgImRldGFjaCIgaW4gYm9hcmRzIERUUyAoIGV4Y2VwdCBTVCBib2FyZCBm
b3IgbGVnYWN5Cj4+Pj4gY29tcGxpYW5jZSkKPj4+PiAzKSBhcyBhIG5leHQgc3RlcCB3ZSB3aWxs
IGhhdmUgdG8gZml4IHRoZSB1bmV4cGVjdGVkIHdhcm5pbmcgb24gdGhlCj4+Pj4gwqDCoMKgwqAg
ImRldGFjaCIgbWFpbGJveC4KPj4+Cj4+PiBXaHkgbm90IG1ha2UgdGhlIG1haWxib3ggYXZhaWxh
YmxlIGJ5IGRlZmF1bHQgb24gYWxsIGJvYXJkcyA/Cj4+Cj4+IEl0IGhhcyBiZWVuIGludHJvZHVj
ZWQgbWFpbmx5IHRvIHRlc3QgdGhlIGRldGFjaCBmZWF0dXJlLAo+PiBvbiBhIHNlY29uZCBwbGF0
Zm9ybSB0byBoZWxwIHJlbW90ZXByb2MgbWFpbnRhaW5lcnMgZm9yIHRoZSByZXZpZXcKPj4gcHJv
Y2Vzcy4gQnV0IHRoZSBmZWF0dXJlIGlzIG5vdCBmdWxseSBpbXBsZW1lbnRlZCBvbiBzdG0zMm1w
MQo+PiAoIGF1dG8gcmVib290IG9mIHRoeWUgTTQgb24gY3Jhc2gsIGFwcHJvcHJpYXRlIHJlc291
cmNlIHRhYmxlIGNsZWFuLXVwLC4uLikKPiAKPiBUaGlzIGlzIGEgZHJpdmVyIGJ1ZywgdW5yZWxh
dGVkIHRvIERUIGRlc2NyaXB0aW9uLCBwbGVhc2UganVzdCBmaXggaXQuCgpObywgaXQgaXMgYSBz
eXN0ZW0gdXNlY2FzZSB0aGF0IGRlcGVuZHMgb24gSGFyZHdhcmUsIE00IGZpcm13YXJlLCBBNwph
cHBsaWNhdGlvbnMsIC4uLgpUaGUgZGV0YWNoL3JlLWF0dGFjaCBpcyBhIHF1aXRlIGNvbXBsZXgg
ZmVhdHVyZSB0aGF0IG5lZWRzIHRvIHVuZGVyc3RhbmQKdGhlIHdob2xlIHBpY3R1cmUuIEFzIGFs
cmVhZHkgbWVudGlvbmVkIGFib3ZlIGl0IGFzIGJlZW4gaW50cm9kdWNlZCBmb3IKdGVzdCBvbiB1
cHN0cmVhbS4KCj4gCj4+IEkgd291bGQgcHJlZmVyIHRvIHJlbW92ZSBpdCBpbiBTVCBib2FyZCBE
VCB0aGFuIGFkZCBpdCBpbiB0aGUgRFRTSS4KPj4gVGhhdCBzYWlkIGFzIG1lbnRpb25lZCBmb3Ig
bGVnYWN5IHN1cHBvcnQsIGJldHRlciB0byBrZWVwIGZvciBTVCBib2FyZC4KPiAKPiBXaHkgbm90
IHJlbW92ZSBpdCBmcm9tIFNUIGJvYXJkcyBpZiB0aGlzIHdhcyBsZWdhY3kgdGVzdCBmZWF0dXJl
IGFuZCBpcyBubwo+IGxvbmdlciBuZWVkZWQgPwoKSWYgeW91IGNhbiBndWFyYW50eSB0aGF0IHRo
aXMgd2lsbCBub3QgaW50cm9kdWNlIHJlZ3Jlc3Npb24gb24gbGVnYWN5LCB5ZXMgd2UgY2FuLgoK
PiAKPj4+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBpZiB0aGUgc29mdHdhcmUgaXMgbm90IHVzaW5n
IHRoZSBkZXRhY2ggbWFpbGJveCwgdGhlcmUKPj4+IGlzIG5vCj4+PiBkb3duc2lkZSwgaXQgd291
bGQganVzdCBiZSB1bnVzZWQuIFVzZXIgY2FuIGFsd2F5cyByZW1vdmUgaXQgaW4gdGhlaXIgRFQg
aWYKPj4+IHJlYWxseSBuZWVkZWQuCj4+Cj4+IFRoZSBpbnZlcnNlIGl0IHRydWUsIFVzZXIgY2Fu
IGFkZCBpdCBpbiB0aGVpciBEVCBpZiByZWFsbHkgbmVlZC4KPiAKPiBJcyB0aGVyZSBhIGRvd25z
aWRlIGlmIHRoaXMgaXMgZW5hYmxlZCBieSBkZWZhdWx0LCB5ZXMgb3Igbm8gPwoKWWVzLCBieSBk
b2luZyB0aGlzIHlvdSBpbXBvc2UgdGhhdCB0aGlzIGNoYW5uZWwgaXMgcmVzZXJ2ZWQgZm9yIHRo
ZSBkZXRhY2guCm1ha2luZyBpdCBubyBtb3JlIG9wdGlvbmFsLgoKPiAKPj4+IEkgYmVsaWV2ZSBv
bmNlIGNhbiBidWlsZCBkZW1vcyB1c2luZyB0aGUgZGV0YWNoIG1haWxib3ggZm9yIGJvYXJkcyB3
aXRoCj4+PiBzdG0zMm1wMTV4eCBub3QgbWFudWZhY3R1cmVkIGJ5IFNULCBjb3JyZWN0ID9bXQo+
Pgo+PiBFdmVyeXRoaW5nIGNvdWxkIGJlIHBvc3NpYmxlLi4uCj4+IE9uY2UgY2FuIHdhbnQgdG8g
cmVwbGFjZSB0aGUgc2h1dGRvd24gbWFpbGJveCBieSB0aGUgZGV0YWNoLgo+PiBPbmNlIGNhbiBh
bHNvIGJ1aWxkIGRlbW8gdXNpbmcgdGhlIGRldGFjaCBtYWlsYm94IGNoYW5uZWwgZm9yIGFub3Ro
ZXIgcHVycG9zZS4KPj4KPj4gSSBxdWl0ZSBjb25mdXNlIHdoeSB5b3UgaW5zaXN0IHRvIGRlY2xh
cmUgdGhpcyBkZXRhY2ggbWFpbGJveCBpbiB0aGUgRFRTST8KPj4gSXMgdGhlcmUgYSBzdHJvbmcg
Y29uc3RyYWludCBvbiB5b3VyIHNpZGU/Cj4gCj4gSSBqdXN0IGRvbid0IHNlZSBhbnkgZXhwbGFu
YXRpb24gd2h5IFNUIGJvYXJkKHMpIHNob3VsZCBiZSBzb21laG93IHNwZWNpYWwgYW5kCj4gaGF2
ZSB0aGUgZGV0YWNoIG1haWxib3ggZGVzY3JpYmVkIGluIERUIGJ5IGRlZmF1bHQsIHdoaWxlIG90
aGVyIGJvYXJkcyB3b3VsZAo+IHJlcXVpcmUgc2VwYXJhdGUgRFQgcGF0Y2ggdG8gdXNlIHRoZSBk
ZXRhY2ggbWFpbGJveCBmaXJzdC4gVGhhdCBqdXN0IHJlZHVjZXMKPiB1c2FiaWxpdHkgb2Ygbm9u
LVNULW1hbnVmYWN0dXJlZCBib2FyZHMgYW5kIGluY3JlYXNlcyBmcmFnbWVudGF0aW9uLiBJIGRv
IG5vdAo+IGxpa2UgdGhhdC4KClRoZSAic29tZWhvdyBzcGVjaWFsIiBzaG91bGQgb25seSBiZSBh
biBpbnRlcm5hbCBNNCBmaXJtd2FyZSAgYWxsb3dpbmcgdG8gdGVzdAp0aGUgZmVhdHVyZSB0byBo
ZWxwIHJlbW90ZXByb2MgbWFpbnRhaW5lcnMgdG8gdmVyaWZ5IGl0IG9uIGRlbWFuZC4KQnV0IEkg
Y2FuIG5vdCBrbm93IGlmIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSBoYXZlIGFub3RoZXIgZmly
bXdhcmUgdXNpbmcKZGV0YWNoIG9uIHRoZSBTVCBib2FyZHMuCkFueXdheSB3aGF0IHlvdSBwcm9w
b3NlIGhlcmUgaXMgdGhhdCB3ZSBpbXBvc2UgaXQgZm9yIGFsbCBib2FyZHMuIFNvbWUgYm9hcmRz
CndvdWxkIHJlcXVpcmUgc2VwYXJhdGUgRFQgcGF0Y2ggdG8gbm90IHVzZSBpdC4gV2UganVzdCBp
bnZlcnNlIHRoZSB0aGluZ3MuLi4KVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCBJIHdvdWxkIG5vdCBp
bXBvc2Ugc29tZXRoaW5nIG9wdGlvbmFsLgoKSW4gdGVybSBvZiBmcmFnbWVudGF0aW9uIEkgY2Fu
IG9ubHkgc2VlIGEgc3BlY2lmaWNpdHkgZm9yIHRoZSBTVCBib2FyZHMuQXMKYWxyZWFkeSBzYWlk
IGlmIHlvdSBjYW4gZW5zdXJlIHRoYXQgdGhpcyB3aWxsIG5vdCBnZW5lcmF0ZSBpbXBhY3Qgb24g
bGVnYWN5LAppdCBjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBTVCBEVC4KCkBBbGV4OiBhbnkgb3Bp
bmlvbiBvbiB0aGF0PwoKUmVnYXJkcwpBcm5hdWQKCgoKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+IExp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiBodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
