Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8030B1032C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jul 2025 10:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8548EC32EB0;
	Thu, 24 Jul 2025 08:17:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08A72C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 08:17:28 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O7xYXJ019443;
 Thu, 24 Jul 2025 10:17:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7kzT0Hpl/NFWqdqEQ0wKSVcFU9pNYe2twdBPGJnr/8o=; b=3xJHwG0+iD9m/4QN
 rbFCod58Hm2lUpPt6E8AILpoUlGTdQX14xlcdHd0rAdE1Qdfn8FbSay3IhXbCyzC
 Ea9Kfe3UIySUfRXHvSgtpRFa5RSue6d+0t9SiMuTqc75O3nINnaSFUAwPihCBHwG
 AkRBgHAFolujHveqkRgwzzee0cIxOEtlkMMBFnsmn9W7tIUB6m4IF+gwJ8i28fhi
 TcjRlFZX6i8zMOgLJ66dh2U4opER27vPA7m3LpejdCOr3Dc12wer/PfyC1UEKw7u
 D/6RbrmfrVgRaVv0bh7c8ur44zDZK+/rgjCvAECMHwG6Ed3kc/GE9x7d3OHgUxif
 rTaqPw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4w9y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jul 2025 10:17:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E75BB40049;
 Thu, 24 Jul 2025 10:15:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 560CB781E01;
 Thu, 24 Jul 2025 10:14:13 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 10:14:12 +0200
Message-ID: <204401b4-b483-47e2-ae73-0994b39bd30c@foss.st.com>
Date: Thu, 24 Jul 2025 10:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julius Werner <jwerner@chromium.org>
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com>
 <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
 <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 05/20] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

SGkgSnVsaXVzLAoKT24gNy8yMy8yNSAyMzo0OCwgSnVsaXVzIFdlcm5lciB3cm90ZToKPj4gKyAg
ICAgIENvbXBhdGlibGUgc3RyaW5ncyBjYW4gYmUgZWl0aGVyIGV4cGxpY2l0IHZlbmRvciBuYW1l
cyBhbmQgcGFydCBudW1iZXJzCj4+ICsgICAgICAoZS5nLiBlbHBpZGEsRUNCMjQwQUJBQ04pLCBv
ciBnZW5lcmF0ZWQgc3RyaW5ncyBvZiB0aGUgZm9ybQo+PiArICAgICAgKGxwKT9kZHJYLVksWiB3
aGVyZSBYLCBZIGFuZCBaIGFyZSBpbiBsb3dlciBjYXNlIGhleGFkZWNpbWFsIHdpdGggbGVhZGlu
Zwo+PiArICAgICAgemVyb2VzIGFuZCA6Cj4+ICsgICAgICAgIC0gWCBpcyB0aGUgU0RSQU0gdmVy
c2lvbiAoMiwgMywgNCwgZXRjLikKPj4gKyAgICAgICAgLSBmb3IgTFBERFIgOgo+PiArICAgICAg
ICAgIC0gWSBpcyB0aGUgbWFudWZhY3R1cmVyIElEIChmcm9tIE1SNSksIDIgYnl0ZXMKPj4gKyAg
ICAgICAgICAtIFogaXMgdGhlIHJldmlzaW9uIElEIChmcm9tIE1SNiBhbmQgTVI3KSwgNCBieXRl
cwo+IAo+IEl0J3MgYWN0dWFsbHkgb25lIGJ5dGUgbWFudWZhY3R1cmVyLCB0d28gYnl0ZXMgcmV2
aXNpb24uIFRoZSBZWSxaWlpaCj4gaXMgc3VwcG9zZWQgdG8gcmVwcmVzZW50IHRoZSBhbW91bnQg
b2YgaGV4IGRpZ2l0cyBuZWVkZWQuCgpPaCB5ZXMgSSBzZWUgbXkgZXJyb3IuLgoKPiAKPj4gKyAg
ICAgICAgLSBmb3IgRERSNCB3aXRoIFNQRCwgYWNjb3JkaW5nIHRvIEpFREVDIFNQRDQuMS4yLkwt
NiA6Cj4+ICsgICAgICAgICAgLSBZIGlzIHRoZSBtYW51ZmFjdHVyZXIgSUQsIDIgYnl0ZXMsIGZy
b20gYnl0ZXMgMzIwIGFuZCAzMjEKPj4gKyAgICAgICAgICAtIFogaXMgdGhlIHJldmlzaW9uIElE
LCAxIGJ5dGUsIGZyb20gYnl0ZSAzNDkKPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCBpZGVu
dGlmeSBhIHBhcnQgdW5hbWJpZ3VvdXNseSwgSSB3b3VsZCBleHBlY3QKPiB0aGUgRERSIHJldmlz
aW9uIElEIHRvIGJlIHNwZWNpZmljIHRvIHRoZSBwYXJ0IG51bWJlci4gKEluIGZhY3QsIHdlJ3Jl
Cj4gYWxzbyBub3Qgc3VyZSB3aGV0aGVyIG1hbnVmYWN0dXJlcityZXZpc2lvbiBpZGVudGlmaWVz
IExQRERSIHBhcnRzCj4gdW5hbWJpZ3VvdXNseSBmb3IgZXZlcnkgdmVuZG9yLCB3ZSBqdXN0IGRp
ZG4ndCBoYXZlIGFueXRoaW5nIG1vcmUgdG8KPiB3b3JrIHdpdGggdGhlcmUuKSBJIHdvdWxkIHN1
Z2dlc3QgdG8gdXNlIGVpdGhlciBgZGRyWC1ZWVlZLEFBQS4uLixaWmAKPiBvciBgZGRyWC1ZWVlZ
LFpaLEFBQS4uLmAgKHdoZXJlIEFBQS4uLiBpcyB0aGUgcGFydCBudW1iZXIgc3RyaW5nIGZyb20K
PiBTUEQgMzI5LTM0OCB3aXRob3V0IHRoZSB0cmFpbGluZyBzcGFjZXMpLiBUaGUgZmlyc3QgdmVy
c2lvbiBsb29rcyBhCj4gYml0IG1vcmUgbmF0dXJhbCBidXQgaXQgbWlnaHQgZ2V0IGNvbmZ1c2lu
ZyBvbiB0aGUgb2ZmIGNoYW5jZSB0aGF0Cj4gc29tZW9uZSB1c2VzIGEgY29tbWEgaW4gYSBwYXJ0
IG51bWJlciBzdHJpbmcuCgpUaGUgZmlyc3Qgb25lIHNlZW1zIGJldHRlciBpbmRlZWQuCklmIHRo
ZSBtYW51ZmFjdHVyZXIgcHV0IGEgY29tbWEgaW4gdGhlIHBhcnQgbnVtYmVyIHdlIHNob3VsZCBo
YW5kbGUgaXQgCmF0IGEgc29mdHdhcmUgbGV2ZWwgdG8gbWUgYW5kIGlmIGl0IGlzIGEgZGV2aWNl
dHJlZSBlcnJvciBpdCBpcyB1cCB0byAKdGhlIGRldmljZXRyZWUgd3JpdGVyIHRvIGZpeCBpdC4K
V2hhdCBkbyB5b3UgdGhpbmsgPwoKPiAKPj4gKyAgICAgIFRoZSBsYXR0ZXIgZm9ybSBjYW4gYmUg
dXNlZnVsIHdoZW4gU0RSQU0gbm9kZXMgYXJlIGNyZWF0ZWQgYXQgcnVudGltZSBieQo+PiArICAg
ICAgYm9vdCBmaXJtd2FyZSB0aGF0IGRvZXNuJ3QgaGF2ZSBhY2Nlc3MgdG8gc3RhdGljIHBhcnQg
bnVtYmVyIGluZm9ybWF0aW9uLgo+IAo+IG5pdDogVGhpcyB0ZXh0IHNsaWdodGx5IGRvZXNuJ3Qg
bWFrZSBzZW5zZSBhbnltb3JlIHdoZW4gaW4gdGhlIEREUgo+IGNhc2Ugd2UgZG8gYWN0dWFsbHkg
aGF2ZSB0aGUgcGFydCBudW1iZXIuIEkgZ3Vlc3MgdGhlIHJlYWwgdGhpbmcgdGhlCj4gYm9vdGxv
YWRlciB3b3VsZG4ndCBoYXZlIGFjY2VzcyB0byBpcyB0aGUgSkVERUMgbWFudWZhY3R1cmVyIElE
IHRvCj4gbmFtZSBtYXBwaW5nLgoKWWVzIEkgd2lsbCB1cGRhdGUgaXQuCgo+IAo+PiArICAgICAg
U0RSQU0gcmV2aXNpb24gSUQ6Cj4+ICsgICAgICAgIC0gTFBERFIgU0RSQU0sIGRlY29kZWQgZnJv
bSBNb2RlIFJlZ2lzdGVyIDYgYW5kIDcuCj4+ICsgICAgICAgIC0gRERSNCBTRFJBTSwgZGVjb2Rl
ZCBmcm9tIHRoZSBTUEQgZnJvbSBieXRlcyAzNDkgYWNjb3JkaW5nIHRvCj4+ICsgICAgICAgICAg
SkVERUMgU1BENC4xLjIuTC02Lgo+IAo+IG5pdDogQ2xhcmlmeSB0aGF0IHRoaXMgaXMgYWx3YXlz
IHR3byBieXRlcyBmb3IgTFBERFIgYW5kIGFsd2F5cyBvbmUKPiBieXRlIGZvciBERFIuCgpPawoK
PiAKPj4gKyAgICAgIERlbnNpdHkgb2YgU0RSQU0gY2hpcCBpbiBtZWdhYml0czoKPj4gKyAgICAg
ICAgLSBMUEREUiBTRFJBTSwgZGVjb2RlZCBmcm9tIE1vZGUgUmVnaXN0ZXIgOC4KPj4gKyAgICAg
ICAgLSBERFI0IFNEUkFNLCBkZWNvZGVkIGZyb20gdGhlIFNQRCBmcm9tIGJ5dGVzIDMyMiB0byAz
MjUgYWNjb3JkaW5nIHRvCj4+ICsgICAgICAgICAgSkVERUMgU1BENC4xLjIuTC02Lgo+IAo+IEFy
ZSB0aGVzZSBudW1iZXJzIGNvcnJlY3Q/IEkgZG93bmxvYWRlZCBTUEQ0LjEuMi5MLTYgbm93IGFu
ZCBpdCBsb29rcwo+IGxpa2UgMzIyIGlzIG1hbnVmYWN0dXJpbmcgbG9jYXRpb24gYW5kIDMyMy0z
MjQgYXJlIG1hbnVmYWN0dXJpbmcgZGF0ZS4KPiAoQWxzbywgSSB0aGluayBhbGwgb2YgdGhlc2Ug
YXJlIHNwZWNpZmljIHRvIEREUjQgKGFuZCBwb3NzaWJseSA1PyksCj4gYnV0IG5vdCB0byBlYXJs
aWVyIHZlcnNpb25zLiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8gbGlzdCBpdCBmb3IKPiBldmVy
eSB2ZXJzaW9uLCBidXQgd2Ugc2hvdWxkIGF0IGxlYXN0IGJlIHNwZWNpZmljIHdoYXQgaXQgYXBw
bGllcyB0by4pCgpJIGp1c3QgcmVvcGVuIHRoZSBkb2MgYW5kIHlvdSBhcmUgcmlnaHQsIGRpZG4n
dCBoYXZlIG15IGdsYXNzZXMgb24gSSBndWVzcy4KQWNjb3JkaW5nbHkgdG8gU1BENC4xLjIuTC02
IGl0IHRoZSBpbmZvIHNlZW1zIGluIHRoZSBieXRlIDQgb24gYml0cyAzfjAuCgpCZXN0IHJlZ2Fy
ZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
