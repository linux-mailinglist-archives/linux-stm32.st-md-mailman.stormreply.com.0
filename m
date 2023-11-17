Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6727EEE29
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 10:13:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52D28C6C83F;
	Fri, 17 Nov 2023 09:13:03 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1F13C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 09:13:01 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d9cbba16084so1697110276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 01:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700212380; x=1700817180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvynnOaR8xM7O4hHqd8ZbKUHknCSu+mkNKpvTcNlZWQ=;
 b=f1UfO744MuMsKQJbJcTVO3JyuWclDvABzZIO+Ce9An4uiR+N4A8yQhguP2S6Y3VznL
 CjQt1qbB6VjWqWnFym7dmEKQQVKbjDwGUBQVMvBjAqNFORNmqJ0ypSoESySpYUXVMTIU
 qdfs+NS1DmJAXjPRwFZmI8SQdaS6OaAioKgUIye2ZQnDsVow+MHmZc+7OCzLCGfPyEHV
 d3nU6PVhHOCdbqZS7URxjpkKDbzp7TGYZwEDivPhni9dMHMv3/lCXCKUPor6jtQWcCck
 Xv+UQesaBzTNsEfpBCFQA/k870gl1BvlcLKopxaNG3NE4S7r8hTFU3Hj/3xol149pDtC
 sC3g==
X-Gm-Message-State: AOJu0YzPY1GUR4q7WHRZiFesy7UEB5MYyouLk7K7Z89HgCP2m4TV7J1B
 g0smfoeAOC8DSXzlOx6Xu83zZ9RZd95y0g==
X-Google-Smtp-Source: AGHT+IEvIxSVoVmdSuiiPYRI8zP+kkU1TvjsonQWQI1LeDxkivK1sZ2rrBx9UXn4A2mlk8jkFKQQGA==
X-Received: by 2002:a25:b28b:0:b0:da0:42f2:431e with SMTP id
 k11-20020a25b28b000000b00da042f2431emr17999647ybj.13.1700212380602; 
 Fri, 17 Nov 2023 01:13:00 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2583c3000000b00da0abddeb02sm318545ybm.34.2023.11.17.01.12.57
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Nov 2023 01:12:58 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d9fe0a598d8so1690295276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 01:12:57 -0800 (PST)
X-Received: by 2002:a25:3792:0:b0:da3:743d:ea3e with SMTP id
 e140-20020a253792000000b00da3743dea3emr18343937yba.21.1700212377409; Fri, 17
 Nov 2023 01:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
 <20231116-stellar-anguished-7cf06eb5634a@squawk>
 <CAMuHMdXdeW9SRN8hq-0722CiLvXDFVwpJxjFTGgdc2mhT=ppYw@mail.gmail.com>
 <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
 <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
In-Reply-To: <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Nov 2023 10:12:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
Message-ID: <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
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

SGkgQ3Jpc3RpYW4sCgpPbiBGcmksIE5vdiAxNywgMjAyMyBhdCA5OjU54oCvQU0gQ3Jpc3RpYW4g
Q2lvY2FsdGVhCjxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gT24g
MTEvMTcvMjMgMTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiA+IE9uIDExLzE3LzIz
IDEwOjM3LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPj4gT24gVGh1LCBOb3YgMTYsIDIw
MjMgYXQgNjo1NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENp
b2NhbHRlYSB3cm90ZToKPiA+Pj4+IE9uIDEwLzMwLzIzIDAwOjUzLCBDcmlzdGlhbiBDaW9jYWx0
ZWEgd3JvdGU6Cj4gPj4+Pj4gT24gMTAvMjkvMjMgMjA6NDYsIEFuZHJldyBMdW5uIHdyb3RlOgo+
ID4+Pj4+PiBPbiBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlh
biBDaW9jYWx0ZWEgd3JvdGU6Cj4gPj4+Pj4+PiBUaGUgQmVhZ2xlViBTdGFybGlnaHQgU0JDIHVz
ZXMgYSBNaWNyb2NoaXAgS1NaOTAzMVJOWENBIFBIWSBzdXBwb3J0aW5nCj4gPj4+Pj4+PiBSR01J
SS1JRC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUT0RPOiBWZXJpZnkgaWYgbWFudWFsIGFkanVzdG1l
bnQgb2YgdGhlIFJYIGludGVybmFsIGRlbGF5IGlzIG5lZWRlZC4gSWYKPiA+Pj4+Pj4+IHllcywg
YWRkIHRoZSBtZGlvICYgcGh5IHN1Yi1ub2Rlcy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gUGxlYXNlIGNv
dWxkIHlvdSB0cnkgdG8gZ2V0IHRoaXMgdGVzdGVkLiBJdCBtaWdodCBzaGVkIHNvbWUgbGlnaHQg
b24KPiA+Pj4+Pj4gd2hhdCBpcyBnb2luZyBvbiBoZXJlLCBzaW5jZSBpdCBpcyBhIGRpZmZlcmVu
dCBQSFkuCj4gPj4+Pj4KPiA+Pj4+PiBBY3R1YWxseSwgdGhpcyBpcyB0aGUgbWFpbiByZWFzb24g
SSBhZGRlZCB0aGUgcGF0Y2guIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MKPiA+Pj4+PiB0byB0aGlzIGJv
YXJkLCBzbyBpdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBjb3VsZCBnZXQgc29tZSBoZWxwIHdpdGgg
dGVzdGluZy4KPiA+Pj4+Cj4gPj4+PiBARW1pbCwgQENvbm9yOiBBbnkgaWRlYSB3aG8gbWlnaHQg
aGVscCB1cyB3aXRoIGEgcXVpY2sgdGVzdCBvbiB0aGUKPiA+Pj4+IEJlYWdsZVYgU3RhcmxpZ2h0
IGJvYXJkPwo+ID4+Pgo+ID4+PiBJIGRvbid0IGhhdmUgb25lICYgSSBhbSBub3Qgc3VyZSBpZiBF
bWlsIGRvZXMuIEdlZXJ0IChDQ2VkKSBzaG91bGQgaGF2ZQo+ID4+Cj4gPj4gSSBiZWxpZXZlIEVz
bWlsIGhhcy4KPiA+Pgo+ID4+PiBvbmUgdGhvdWdoLiBJcyB0aGVyZSBhIHNwZWNpZmljIHRlc3Qg
eW91IG5lZWQgdG8gaGF2ZSBkb25lPwo+ID4+Cj4gPj4gSSBnYXZlIGl0IGEgdHJ5LCBvbiB0b3Ag
b2YgbGF0ZXN0IHJlbmVzYXMtZHJpdmVyc1sxXS4KPgo+IFsuLi5dCj4KPiA+Pgo+ID4+IExvb2tz
IGxpa2UgaXQgbmVlZHMgbW9yZSBub24tY29oZXJlbnQgc3VwcG9ydCBiZWZvcmUgd2UgY2FuIHRl
c3QKPiA+PiBFdGhlcm5ldC4KPiA+Cj4gPiBIaSBHZWVydCwKPiA+Cj4gPiBUaGFua3MgZm9yIHRh
a2luZyB0aGUgdGltZSB0byB0ZXN0IHRoaXMhCj4gPgo+ID4gQ291bGQgeW91IHBsZWFzZSBjaGVj
ayBpZiB0aGUgZm9sbG93aW5nIGFyZSBlbmFibGVkIGluIHlvdXIga2VybmVsIGNvbmZpZzoKPiA+
Cj4gPiAgIENPTkZJR19ETUFfR0xPQkFMX1BPT0wKPiA+ICAgQ09ORklHX1JJU0NWX0RNQV9OT05D
T0hFUkVOVAo+ID4gICBDT05GSUdfUklTQ1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTCj4gPiAgIENP
TkZJR19TSUZJVkVfQ0NBQ0hFCgpDT05GSUdfRE1BX0dMT0JBTF9QT09MIGFuZCBDT05GSUdfUklT
Q1ZfTk9OU1RBTkRBUkRfQ0FDSEVfT1BTIHdlcmUKaW5kZWVkIG5vIGxvbmdlciBlbmFibGVkLCBh
cyB0aGV5IGNhbm5vdCBiZSBlbmFibGVkIG1hbnVhbGx5LgoKQWZ0ZXIgY2hlcnJ5LXBpY2tpbmcg
Y29tbWl0IGUxNGFkOWZmNjdmZDUxZGMgKCJyaXNjdjogZXJyYXRhOiBBZGQKU3RhckZpdmUgSkg3
MTAwIGVycmF0YSIpIGluIGVzbWlsL3Zpc2lvbmZpdmUgdGhlc2Ugb3B0aW9ucyBiZWNvbWUKZW5h
YmxlZC4gTm93IGl0IGdldHMgYSBiaXQgZnVydGhlciwgYnV0IHN0aWxsIGxvdHMgb2YgQ0NBQ0hF
IERhdGFGYWlsCmVycm9ycy4KCj4gQWxzbyBwbGVhc2Ugbm90ZSB0aGUgc2VyaWVzIHJlcXVpcmVz
IHRoZSBTaUZpdmUgQ29tcG9zYWJsZSBDYWNoZQo+IGNvbnRyb2xsZXIgcGF0Y2hlcyBwcm92aWRl
ZCBieSBFbWlsIFsxXS4KPgo+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMx
MDMxMTQxNDQ0LjUzNDI2LTEtZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbS8KClRo
YXQgc2VyaWVzIGRvZXMgbm90IGNvbnRhaW4gYW55IEtjb25maWcgY2hhbmdlcywgc28gdGhlcmUg
bXVzdCBiZQpvdGhlciBtaXNzaW5nIGRlcGVuZGVuY2llcz8KClBlcmhhcHMgSSBzaG91bGQganVz
dCBkZWZlciB0byBFbWlsIDstKQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
