Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F273489E139
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 19:14:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9ED92C6C858;
	Tue,  9 Apr 2024 17:14:09 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35A98C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 17:14:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 980B2CE22E0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 17:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2698C4160D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712682843;
 bh=LPEx6tsL7wgLYi+kk5vkpbbYiQkRmiIS+PLtSy0YjfY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pcmC9XFN912RMvFMTBsOxs05rus3ioP7iQqJNazGrzDoiP7Ljc4Y9u/OFo2drMYc5
 Y47oEgBi7UKRS5do5zUKwbtZ6obphKVWoEavPZT728bSAwtVk7J8TSsQZX4ZSa7DKv
 hpFtmGvI8QwKr8MN2FMRQIJIRKkYD8x6LP5+Ja/yJW27JqneVDqXo/cNBtG96EGr+G
 T2mQsRtFnusKVDFoDxcoM5aumg8aLfbIe3M865YcFvvVFW1WBeBZOTRWODvbam1aBD
 yAl1wwAPpS2WSDZ6sYFOjTipL19UOEuq8sVy1JM2KysQHpLosxbKubCxvsHDf3sSbL
 +uaHRk85y/R4A==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516d3a470d5so5463821e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 10:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/ZhDuk8Bo/mYCzFODYji1CZDxCxk3WJ8KIVEzAvgGZ7mtTlO3NtI5WTi5YStbG13/TBBkilbmujhktFBUfCGAZ/0tyXS5EzjkPCysr1MVeMaXCkEZWk8u
X-Gm-Message-State: AOJu0YyX3PBqdxUo4YdC1sxsubXTEYZdsHvj8R2bl+Zh9mbRBiGbKWJw
 mjMiMySLDiy0SJykBW2Pmdi2AV38Sddg1YJWu4OBicB2ieMX9CYvFHpyX2TjPiqhKTdaufs5mCv
 4/FPTUECbNKTI1kcd9U3+F7xu9Q==
X-Google-Smtp-Source: AGHT+IHdmA/YWkORigJ39s8mUHP/Uw9g5JVSthQiryNaRNFp29Jw8Pu75u88BQ1j6apcee4IbBJ9bbXspK3Ch4S3xfA=
X-Received: by 2002:ac2:4acb:0:b0:515:99f6:2ca4 with SMTP id
 m11-20020ac24acb000000b0051599f62ca4mr50062lfp.36.1712682841868; Tue, 09 Apr
 2024 10:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
In-Reply-To: <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Apr 2024 12:13:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Message-ID: <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 alsa-devel@alsa-project.org, edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, lars@metafoo.de, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, richardcochran@gmail.com, mkl@pengutronix.de,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org, rcsekar@samsung.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 00/13] Introduce STM32 Firewall
	framework
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

T24gTW9uLCBBcHIgOCwgMjAyNCBhdCAzOjQ04oCvQU0gQWxleGFuZHJlIFRPUkdVRQo8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBIaSBHYXRpZW4sCj4KPiBPbiAxLzUv
MjQgMTQ6MDMsIEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+ID4gSW50cm9kdWNlIFNUTTMyIEZp
cmV3YWxsIGZyYW1ld29yayBmb3IgU1RNMzJNUDF4IGFuZCBTVE0zMk1QMngKPiA+IHBsYXRmb3Jt
cy4gU1RNMzJNUDF4KEVUWlBDKSBhbmQgU1RNMzJNUDJ4KFJJRlNDKSBGaXJld2FsbCBjb250cm9s
bGVycwo+ID4gcmVnaXN0ZXIgdG8gdGhlIGZyYW1ld29yayB0byBvZmZlciBmaXJld2FsbCBzZXJ2
aWNlcyBzdWNoIGFzIGFjY2Vzcwo+ID4gZ3JhbnRpbmcuCj4gPgo+ID4gVGhpcyBzZXJpZXMgb2Yg
cGF0Y2hlcyBpcyBhIG5ldyBhcHByb2FjaCBvbiB0aGUgcHJldmlvdXMgU1RNMzIgc3lzdGVtCj4g
PiBidXMsIGhpc3RvcnkgaXMgYXZhaWxhYmxlIGhlcmU6Cj4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjMwMTI3MTY0MDQwLjEwNDc1ODMvCj4gPgo+ID4gVGhlIG5lZWQgZm9yIHN1
Y2ggZnJhbWV3b3JrIGFyaXNlcyBmcm9tIHRoZSBmYWN0IHRoYXQgdGhlcmUgYXJlIG5vdwo+ID4g
bXVsdGlwbGUgaGFyZHdhcmUgZmlyZXdhbGxzIGltcGxlbWVudGVkIGFjcm9zcyBtdWx0aXBsZSBw
cm9kdWN0cy4KPiA+IERyaXZlcnMgYXJlIHNoYXJlZCBiZXR3ZWVuIGRpZmZlcmVudCBwcm9kdWN0
cywgdXNpbmcgdGhlIHNhbWUgY29kZS4KPiA+IFdoZW4gaXQgY29tZXMgdG8gZmlyZXdhbGxzLCB0
aGUgcHVycG9zZSBtb3N0bHkgc3RheXMgdGhlIHNhbWU6IFByb3RlY3QKPiA+IGhhcmR3YXJlIHJl
c291cmNlcy4gQnV0IHRoZSBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzLCBhbmQgdGhlcmUgYXJlCj4g
PiBtdWx0aXBsZSB0eXBlcyBvZiBmaXJld2FsbHM6IHBlcmlwaGVyYWwsIG1lbW9yeSwgLi4uCj4g
Pgo+ID4gU29tZSBoYXJkd2FyZSBmaXJld2FsbCBjb250cm9sbGVycyBzdWNoIGFzIHRoZSBSSUZT
QyBpbXBsZW1lbnRlZCBvbgo+ID4gU1RNMzJNUDJ4IHBsYXRmb3JtcyBtYXkgcmVxdWlyZSB0byB0
YWtlIG93bmVyc2hpcCBvZiBhIHJlc291cmNlIGJlZm9yZQo+ID4gYmVpbmcgYWJsZSB0byB1c2Ug
aXQsIGhlbmNlIHRoZSByZXF1aXJlbWVudCBmb3IgZmlyZXdhbGwgc2VydmljZXMgdG8KPiA+IHRh
a2UvcmVsZWFzZSB0aGUgb3duZXJzaGlwIG9mIHN1Y2ggcmVzb3VyY2VzLgo+ID4KPiA+IE9uIHRo
ZSBvdGhlciBoYW5kLCBoYXJkd2FyZSBmaXJld2FsbCBjb25maWd1cmF0aW9ucyBhcmUgYmVjb21p
bmcKPiA+IG1vcmUgYW5kIG1vcmUgY29tcGxleC4gVGhlc2UgbWVjYW5pc21zIHByZXZlbnQgcGxh
dGZvcm0gY3Jhc2hlcwo+ID4gb3Igb3RoZXIgZmlyZXdhbGwtcmVsYXRlZCBpbmNvdmVuaWVuY2Vz
IGJ5IGRlbnlpbmcgYWNjZXNzIHRvIHNvbWUKPiA+IHJlc291cmNlcy4KPiA+Cj4gPiBUaGUgc3Rt
MzIgZmlyZXdhbGwgZnJhbWV3b3JrIG9mZmVycyBhbiBBUEkgdGhhdCBpcyBkZWZpbmVkIGluCj4g
PiBmaXJld2FsbCBjb250cm9sbGVycyBkcml2ZXJzIHRvIGJlc3QgZml0IHRoZSBzcGVjaWZpY2l0
eSBvZiBlYWNoCj4gPiBmaXJld2FsbC4KPiA+Cj4gPiBGb3IgZXZlcnkgcGVyaXBoZXJhbHMgcHJv
dGVjdGVkIGJ5IGVpdGhlciB0aGUgRVRaUEMgb3IgdGhlIFJJRlNDLCB0aGUKPiA+IGZpcmV3YWxs
IGZyYW1ld29yayBjaGVja3MgdGhlIGZpcmV3YWxsIGNvbnRyb2xlbHIgcmVnaXN0ZXJzIHRvIHNl
ZSBpZgo+ID4gdGhlIHBlcmlwaGVyYWwncyBhY2Nlc3MgaXMgZ3JhbnRlZCB0byB0aGUgTGludXgg
a2VybmVsLiBJZiBub3QsIHRoZQo+ID4gcGVyaXBoZXJhbCBpcyBjb25maWd1cmVkIGFzIHNlY3Vy
ZSwgdGhlIG5vZGUgaXMgbWFya2VkIHBvcHVsYXRlZCwKPiA+IHNvIHRoYXQgdGhlIGRyaXZlciBp
cyBub3QgcHJvYmVkIGZvciB0aGF0IGRldmljZS4KPiA+Cj4gPiBUaGUgZmlyZXdhbGwgZnJhbWV3
b3JrIHJlbGllcyBvbiB0aGUgYWNjZXNzLWNvbnRyb2xsZXIgZGV2aWNlIHRyZWUKPiA+IGJpbmRp
bmcuIEl0IGlzIHVzZWQgYnkgcGVyaXBoZXJhbHMgdG8gcmVmZXJlbmNlIGEgZG9tYWluIGFjY2Vz
cwo+ID4gY29udHJvbGxlci4gSW4gdGhpcyBjYXNlIGEgZmlyZXdhbGwgY29udHJvbGxlci4gVGhl
IGJ1cyB1c2VzIHRoZSBJRAo+ID4gcmVmZXJlbmNlZCBieSB0aGUgYWNjZXNzLWNvbnRyb2xsZXIg
cHJvcGVydHkgdG8ga25vdyB3aGVyZSB0byBsb29rCj4gPiBpbiB0aGUgZmlyZXdhbGwgdG8gZ2V0
IHRoZSBzZWN1cml0eSBjb25maWd1cmF0aW9uIGZvciB0aGUgcGVyaXBoZXJhbC4KPiA+IFRoaXMg
YWxsb3dzIGEgZGV2aWNlIHRyZWUgZGVzY3JpcHRpb24gcmF0aGVyIHRoYW4gYSBoYXJkY29kZWQg
cGVyaXBoZXJhbAo+ID4gdGFibGUgaW4gdGhlIGJ1cyBkcml2ZXIuCj4gPgo+ID4gVGhlIFNUTTMy
IEVUWlBDIGRldmljZSBpcyByZXNwb25zaWJsZSBmb3IgZmlsdGVyaW5nIGFjY2Vzc2VzIGJhc2Vk
IG9uCj4gPiBzZWN1cml0eSBsZXZlbCwgb3IgY28tcHJvY2Vzc29yIGlzb2xhdGlvbiBmb3IgYW55
IHJlc291cmNlIGNvbm5lY3RlZAo+ID4gdG8gaXQuCj4gPgo+ID4gVGhlIFJJRlNDIGlzIHJlc3Bv
bnNpYmxlIGZvciBmaWx0ZXJpbmcgYWNjZXNzZXMgYmFzZWQgb24gQ29tcGFydG1lbnQKPiA+IElE
IC8gc2VjdXJpdHkgbGV2ZWwgLyBwcml2aWxlZ2UgbGV2ZWwgZm9yIGFueSByZXNvdXJjZSBjb25u
ZWN0ZWQgdG8KPiA+IGl0Lgo+ID4KPiA+IFNUTTMyTVAxMy8xNS8yNSBTb0MgZGV2aWNlIHRyZWUg
ZmlsZXMgYXJlIHVwZGF0ZWQgaW4gdGhpcyBzZXJpZXMgdG8KPiA+IGltcGxlbWVudCB0aGlzIG1l
Y2FuaXNtLgo+ID4KPgo+IC4uLgo+Cj4gQWZ0ZXIgbWlub3IgY29zbWV0aWMgZml4ZXMsIHNlcmll
cyBhcHBsaWVkIG9uIHN0bTMyLW5leHQuCj4gU2VlbiB3aXRoIEFybmQ6IGl0IHdpbGwgYmUgcGFy
dCBvbiBteSBuZXh0IFBSIGFuZCB3aWxsIGNvbWUgdGhyb3VnaAo+IGFybS1zb2MgdHJlZS4KCkFu
ZCB0aGVyZSdzIHNvbWUgbmV3IHdhcm5pbmdzIGluIG5leHQgd2l0aCBpdDoKCiAgICAgIDEgIHZl
bmNANDgwZTAwMDA6ICdhY2Nlc3MtY29udHJvbGxlcnMnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0
aGUKcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJwogICAgICAxICB2ZGVjQDQ4MGQwMDAwOiAnYWNj
ZXNzLWNvbnRyb2xsZXJzJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlCnJlZ2V4ZXM6ICdwaW5j
dHJsLVswLTldKycKClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
