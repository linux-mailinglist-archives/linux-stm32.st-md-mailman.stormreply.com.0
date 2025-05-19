Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC9CABBD17
	for <lists+linux-stm32@lfdr.de>; Mon, 19 May 2025 13:58:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7563C78F90;
	Mon, 19 May 2025 11:58:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA6AC78F8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 11:58:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JAPBUH010261;
 Mon, 19 May 2025 13:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VhjPX55qNqqjOxzpxaedZHl4L7VXx1ilpZg/AhTGduY=; b=sTzvXOOswe4ROvPG
 wsi9pzxc8l7SmQtEn1cEs8UoqqJbLbbcZ1xMECJbiq1S3y0RA8viWW7igJfs4KlW
 NQ8v1y/7DTwtB5EfpKOR3ECofwz8Jt0GqCb3pERCqHa36EAXZqdmKzPFp1PgG/QF
 mGIirgK2io2f+MnsimmDdwRpapmyu1M3a8v/L3G85d4lMzNJOzW+R9/jO1o/37TE
 s6XFHANiQhMqJwyt/3C0sDM5Qpt10E4Cc2LcpAxcI3Dv14swyuUQb6/BotJtw7gx
 yfOHwbuoXUrItpHiKj4LwLP2P6XNIbmoFN26X+MsUbTC5W4n6CRrm3+nS+PrHEbi
 tjjGxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfk9ybbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 13:58:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 38C8F4004A;
 Mon, 19 May 2025 13:57:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E748AE37A;
 Mon, 19 May 2025 13:57:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 13:57:02 +0200
Message-ID: <d783a0cb-9b5f-4757-bba2-ef425c79f6c7@foss.st.com>
Date: Mon, 19 May 2025 13:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
 <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
 <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add nvmem-cells to
 ethernet nodes for constant mac-addresses
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

SGkgVXdlCgpPbiA1LzE2LzI1IDExOjUwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxs
bywKPiAKPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAwNTowNzowMFBNICswMjAwLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPj4gT24gRnJpLCBNYXIgMjgsIDIwMjUgYXQgMDY6MTQ6MDVQTSAr
MDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+PiBUaGUgZWZ1c2UgZGV2aWNlIHRyZWUg
ZGVzY3JpcHRpb24gYWxyZWFkeSBoYXMgdGhlIHR3byBsYWJlbHMgcG9pbnRpbmcgdG8KPj4+IHRo
ZSBlZnVzZSBub2RlcyB0aGF0IHNwZWNpZnkgdGhlIG1hYy1hZGRyZXNzZXMgdG8gYmUgdXNlZC4g
V2lyZSB0aGVtIHVwCj4+PiB0byB0aGUgZXRoZXJuZXQgbm9kZXMuIFRoaXMgaXMgZW5vdWdoIHRv
IG1ha2UgYmFyZWJveCBwaWNrIHRoZSByaWdodAo+Pj4gbWFjLWFkZHJlc3NlcyBhbmQgcGFzcyB0
aGVtIHRvIExpbnV4Lgo+Pj4KPj4+IFN1Z2dlc3RlZC1ieTogQWhtYWQgRmF0b3VtIDxhLmZhdG91
bUBwZW5ndXRyb25peC5kZT4KPj4+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgo+Pgo+PiBJIHdvbmRlciBpZiB0aGlzIHBhdGNo
IGlzIG9uIHNvbWVvbmUncyByYWRhcj8hCj4gCj4gSSBzdGlsbCB3b25kZXIuIElzIHRoaXMganVz
dCBkdWUgdG8gLUVOT1RJTUUgZm9yIHRoZSBtYWludGFpbmVycywgb3IgYXJlCj4gdGhlcmUgZG91
YnRzIGFib3V0IHRoaXMgcGF0Y2g/CgpObyBkb3VidCBqdXN0IG15IGZhdWx0IGFzIHRoaXMgcGF0
Y2ggd2VudCBvZmYgbXkgcmFkYXIuIFNvcnJ5LgoKQXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhh
bmtzCkFsZXgKCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
