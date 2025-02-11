Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD42A2FF81
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2025 01:47:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBED9C78F95;
	Tue, 11 Feb 2025 00:47:11 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6707BC78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2025 00:47:10 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4679eacf2c5so51651051cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 16:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739234829; x=1739839629;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
 b=UJultQuWOEAW3iNO64XfzQLqdeQ5xvW4hR+HVoR31L75vplHgEq9N6jvGkraUPe9UQ
 zPq2m0mm27xQ40jM2Zvf/eUGyJHcy9ys0XSLvoaAd+NE7lK5SHN1q4ORmDhQoQ1/ncQm
 lxk/noDt6oepCPE09R9KfkJF7GjZzZrA8sodixJnEK9U6uSxI7I1NgF9jwLp7lD/lOlx
 8881TJ3oGXwb46vMhO9+Mwormo3L8fuh7mlZ+i5xUkjFxUSEH1P/5iocVAWjSNjfRH41
 aPx4Wy5z/fGw1Nqf3tacyu52eg7CE8Z8n08x6eUCdZ25YzsMZ5sqVbKzzA/TdlD4RAG7
 /3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739234829; x=1739839629;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTIEVTb8WG6g/xYwFCZRA14WxKqhOtoX7+ICXbI2OMk=;
 b=R8z9/WIOxLK4Uy8rFNdevWetNdQZunrJK3F6holVYH7nT0jrfMKo1JLxFCp5AhVAa3
 5wtJWcB/opy6ODUrFXDCEOryTSi4sxTfYDIvT6KixGujbOFy3aJ4jeeO9tjOU/I/fxSw
 8CsnKXuqCndUUfgbdbzeU8JrN4Q4gg0A+VDVfxztd44Dpgx/31OxBitWR69sHCMQUSRP
 jzTu3Gm2TdrdF3Pv8X/LIC5BbuBTd3HfrX6DfhjkyF0NxLe3rNLCKBBiEe8QjIMi5UM4
 11l2LCsg1VfIvgINbk2y6TI1Osi6qWGTHDLwb8Jwz/pT+ppLdQM9E0qD956IeoReb/uO
 +3Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRilmf0uMMRDysqUamZ1mz8J00gDj5vKsrtp3mhqACbD5IYXfe+OOPzRtpzzLs6M38rqzAhxB3U5/VRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyfly7ii5r/aKC+mM4XnkIFKvNq2CLqRlp+yf5Efrz+jdM3ecAT
 0Jk7ZanJHDLjFv+9XfykO2C8b0rugv9iFx+WzjRfdNiYSO8LOxON
X-Gm-Gg: ASbGnctEVSfKh1uorxJgcFqstGprm5lZRU0au6GTUZeYDR19xYJg3digIiq2p5PCFqW
 xwdZr+8Lp0VEm+8IE0ohVS0QQ9vaSi8Zh8HynX+XCELeGyQBd1JxcevYgsvq4R+FW5CIJVjuMDb
 NKwITGUqRd0b42Jy0xhHkOYdpT7RjZl0OKpSlMGq8QoCU3j+0QOWzuPOFPAplso/bbxdjhFVoIX
 X0gg4Q38D7c1xdI8LTKuNoPn1KJ4EI07dNFtotrRyHObtlM/uFkcAC+u3bjBSm6rV8=
X-Google-Smtp-Source: AGHT+IHdTWiwpRzbdPuvlFEYzABE9ESxasKSuFHVRX5pGBvoEIPULEvUws7kobHnz0ZNoja0v14wbA==
X-Received: by 2002:a05:6214:dc7:b0:6d4:1e43:f3a5 with SMTP id
 6a1803df08f44-6e4455f4e38mr268033066d6.13.1739234829280; 
 Mon, 10 Feb 2025 16:47:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6e459711533sm26289906d6.18.2025.02.10.16.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 16:47:08 -0800 (PST)
Date: Tue, 11 Feb 2025 08:47:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Jisheng Zhang <jszhang@kernel.org>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
 Simon Horman <horms@kernel.org>, Furong Xu <0x1207@gmail.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <uhup3bm6ez6kg7efvimy6rcthmqfcdkg2vmcwafqz33vouplfl@i25wn6q6c4h6>
References: <20250209013054.816580-1-inochiama@gmail.com>
 <20250209013054.816580-4-inochiama@gmail.com>
 <2379380.ElGaqSPkdT@fw-rgant>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2379380.ElGaqSPkdT@fw-rgant>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/3] net: stmmac: Add glue
 layer for Sophgo SG2044 SoC
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMTI6MDE6NTZQTSArMDEwMCwgUm9tYWluIEdhbnRvaXMg
d3JvdGU6Cj4gSGVsbG8gSW5vY2hpLAo+IAo+IE9uIGRpbWFuY2hlIDkgZsOpdnJpZXIgMjAyNSAw
MjozMDo1MiBoZXVyZSBub3JtYWxlIGTigJlFdXJvcGUgY2VudHJhbGUgSW5vY2hpIAo+IEFtYW90
byB3cm90ZToKPiA+IEFkZHMgU29waGdvIGR3bWFjIGRyaXZlciBzdXBwb3J0IG9uIHRoZSBTb3Bo
Z28gU0cyMDQ0IFNvQy4KPiAuLi4KPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvcGhnby5jCj4gPiBAQCAtMCwwICsx
LDEwNSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKwo+ID4gKy8q
Cj4gPiArICogU29waGdvIERXTUFDIHBsYXRmb3JtIGRyaXZlcgo+ID4gKyAqCj4gPiArICogQ29w
eXJpZ2h0IChDKSAyMDI0IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAr
ICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiAKPiBJdCBkb2Vzbid0IGxv
b2sgbGlrZSB0aGlzIGluY2x1ZGUgaXMgdXNlZCwgY291bGQgeW91IHBsZWFzZSByZW1vdmUgaXQ/
Cj4gCgpUaGFua3MsIEkgd2lsbC4gQW5kIEkgd2lsbCBhZGQgdGhlIG1pc3MgaGVhZGVyIApsaW51
eC9jbGsuaCBhbmQgbGludXgvbW9kdWxlLmguCgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2
aWNldGFibGUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGh5Lmg+Cj4gPiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlICJzdG1tYWNfcGxhdGZv
cm0uaCIKPiA+ICsKPiA+ICtzdHJ1Y3Qgc29waGdvX2R3bWFjIHsKPiA+ICsJc3RydWN0IGRldmlj
ZSAqZGV2Owo+ID4gKwlzdHJ1Y3QgY2xrICpjbGtfdHg7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0
aWMgdm9pZCBzb3BoZ29fZHdtYWNfZml4X21hY19zcGVlZCh2b2lkICpwcml2LCB1bnNpZ25lZCBp
bnQgc3BlZWQsCj4gPiB1bnNpZ25lZCBpbnQgbW9kZSkgK3sKPiA+ICsJc3RydWN0IHNvcGhnb19k
d21hYyAqZHdtYWMgPSBwcml2Owo+ID4gKwlsb25nIHJhdGU7Cj4gPiArCWludCByZXQ7Cj4gPiAr
Cj4gPiArCXJhdGUgPSByZ21paV9jbG9jayhzcGVlZCk7Cj4gPiArCWlmIChyYXRlIDwgMCkgewo+
ID4gKwkJZGV2X2Vycihkd21hYy0+ZGV2LCAiaW52YWxpZCBzcGVlZCAldVxuIiwgc3BlZWQpOwo+
ID4gKwkJcmV0dXJuOwo+ID4gKwl9Cj4gPiArCj4gPiArCXJldCA9IGNsa19zZXRfcmF0ZShkd21h
Yy0+Y2xrX3R4LCByYXRlKTsKPiA+ICsJaWYgKHJldCkKPiA+ICsJCWRldl9lcnIoZHdtYWMtPmRl
diwgImZhaWxlZCB0byBzZXQgdHggcmF0ZSAlbHU6ICVwZVxuIiwKPiAKPiBuaXQ6IHNob3VsZG4n
dCB0aGlzIGJlICIlbGQiPwo+IAoKWWVhaCwgaXQgaXMgbXkgbWlzdGFrZSwgSSB3aWxsIGZpeCBp
dC4KCj4gPiArCQkJcmF0ZSwgRVJSX1BUUihyZXQpKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGlj
IGludCBzb3BoZ29fc2cyMDQ0X2R3bWFjX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diwKPiA+ICsJCQkJICAgIHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQsCj4g
PiArCQkJCSAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyAqc3RtbWFjX3JlcykKPiA+ICt7Cj4g
PiArCXN0cnVjdCBzb3BoZ29fZHdtYWMgKmR3bWFjOwo+ID4gKwo+ID4gKwlkd21hYyA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmR3bWFjKSwgR0ZQX0tFUk5FTCk7Cj4gPiArCWlm
ICghZHdtYWMpCj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsJZHdtYWMtPmNsa190
eCA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5kZXYsICJ0eCIpOwo+ID4gKwlpZiAoSVNf
RVJSKGR3bWFjLT5jbGtfdHgpKQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRl
diwgUFRSX0VSUihkd21hYy0+Y2xrX3R4KSwKPiA+ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCB0
eCBjbG9ja1xuIik7Cj4gPiArCj4gPiArCWR3bWFjLT5kZXYgPSAmcGRldi0+ZGV2Owo+ID4gKwlw
bGF0X2RhdC0+YnNwX3ByaXYgPSBkd21hYzsKPiA+ICsJcGxhdF9kYXQtPmZsYWdzIHw9IFNUTU1B
Q19GTEFHX1NQSF9ESVNBQkxFOwo+ID4gKwlwbGF0X2RhdC0+Zml4X21hY19zcGVlZCA9IHNvcGhn
b19kd21hY19maXhfbWFjX3NwZWVkOwo+ID4gKwlwbGF0X2RhdC0+bXVsdGljYXN0X2ZpbHRlcl9i
aW5zID0gMDsKPiA+ICsJcGxhdF9kYXQtPnVuaWNhc3RfZmlsdGVyX2VudHJpZXMgPSAxOwo+ID4g
Kwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBzb3BoZ29fZHdt
YWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArCXN0cnVj
dCBwbGF0X3N0bW1hY2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiArCXN0cnVjdCBzdG1tYWNfcmVz
b3VyY2VzIHN0bW1hY19yZXM7Cj4gCj4gbml0OiBJIHRoaW5rIGFkZGluZyAic3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsiIGhlcmUgd291bGQKPiBiZSBiZXR0ZXIgdGhhbiByZXBlYXRp
bmcgIiZwZGV2LT5kZXYiIGxhdGVyIG9uLgo+IAoKVGhhbmtzLCBJIHdpbGwgY2hhbmdlIHRoYXQu
Cgo+ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBzdG1tYWNfZ2V0X3BsYXRmb3JtX3Jl
c291cmNlcyhwZGV2LCAmc3RtbWFjX3Jlcyk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlyZXR1cm4g
ZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsCj4gPiArCQkJCSAgICAgImZhaWxlZCB0byBn
ZXQgcmVzb3VyY2VzXG4iKTsKPiAKPiBUaGlzIGVycm9yIG1lc3NhZ2UgaXMgYSBiaXQgdG9vIHZh
Z3VlLCBtYXliZSByZXBsYWNlIGl0IHdpdGggImZhaWxlZCB0byBnZXQgCj4gcGxhdGZvcm0gcmVz
b3VyY2VzIj8KPiAKCk9LLgoKPiA+ICsKPiA+ICsJcGxhdF9kYXQgPSBkZXZtX3N0bW1hY19wcm9i
ZV9jb25maWdfZHQocGRldiwgc3RtbWFjX3Jlcy5tYWMpOwo+ID4gKwlpZiAoSVNfRVJSKHBsYXRf
ZGF0KSkKPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIocGxh
dF9kYXQpLAo+ID4gKwkJCQkgICAgICJkdCBjb25maWd1cmF0aW9uIGZhaWxlZFxuIik7Cj4gCj4g
VGhpcyBlcnJvciBtZXNzYWdlIGlzIGEgYml0IG1pc2xlYWRpbmcgSU1PLCBJIHdvdWxkIHJlcGxh
Y2UgaXQgd2l0aAo+IHNvbWV0aGluZyBsaWtlICJmYWlsZWQgdG8gcGFyc2UgZGV2aWNlLXRyZWUg
cGFyYW1ldGVycyIuCj4gCgpPSy4KCj4gPiArCj4gPiArCXJldCA9IHNvcGhnb19zZzIwNDRfZHdt
YWNfaW5pdChwZGV2LCBwbGF0X2RhdCwgJnN0bW1hY19yZXMpOwo+ID4gKwlpZiAocmV0KQo+ID4g
KwkJcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsJcmV0dXJuIHN0bW1hY19kdnJfcHJvYmUoJnBkZXYt
PmRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc29waGdvX2R3bWFjX21hdGNoW10gPSB7Cj4gPiArCXsg
LmNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0NC1kd21hYyIgfSwKPiA+ICsJeyAvKiBzZW50aW5l
bCAqLyB9Cj4gPiArfTsKPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzb3BoZ29fZHdtYWNf
bWF0Y2gpOwo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNvcGhnb19k
d21hY19kcml2ZXIgPSB7Cj4gPiArCS5wcm9iZSAgPSBzb3BoZ29fZHdtYWNfcHJvYmUsCj4gPiAr
CS5yZW1vdmUgPSBzdG1tYWNfcGx0ZnJfcmVtb3ZlLAo+ID4gKwkuZHJpdmVyID0gewo+ID4gKwkJ
Lm5hbWUgPSAic29waGdvLWR3bWFjIiwKPiA+ICsJCS5wbSA9ICZzdG1tYWNfcGx0ZnJfcG1fb3Bz
LAo+ID4gKwkJLm9mX21hdGNoX3RhYmxlID0gc29waGdvX2R3bWFjX21hdGNoLAo+ID4gKwl9LAo+
ID4gK307Cj4gPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzb3BoZ29fZHdtYWNfZHJpdmVyKTsK
PiA+ICsKPiA+ICtNT0RVTEVfQVVUSE9SKCJJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwu
Y29tPiIpOwo+ID4gK01PRFVMRV9ERVNDUklQVElPTigiU29waGdvIERXTUFDIHBsYXRmb3JtIGRy
aXZlciIpOwo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiAKPiBUaGFua3MsCj4gCj4gLS0g
Cj4gUm9tYWluIEdhbnRvaXMsIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
