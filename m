Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C5A5C255
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Mar 2025 14:20:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13CC4C78F85;
	Tue, 11 Mar 2025 13:20:31 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC1E3CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 13:20:29 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-523f721bc63so2956770e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Mar 2025 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741699229; x=1742304029;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
 b=ODe1Lfp1rrU7v048S+Djm+edDSJtr0eLr0k8Zw11e2ZomJ9vaTgcS+/desmAbi1ICC
 Pgda4spfA4T8qS+e3CeBFh/bj6VepqwF4PRPf8fA34XLziHBfX/gsGFosDyH6OoXBfNO
 e1YTw0k+hDgOCx2dsuR8w2gn4oCAq7YUsl75fEzWzNgbUr0t3n+pMOrffYnx9no5tBh2
 dBECOBVWmv218Vnr8FmyesRZQ71UPzRbbc/hiJfD+rOadWHwTvGz1NYfgX6VwCuZrMBt
 J3qf3S1g8AWt2c3vY5ECeIjjgVRKKbPTjfvO5N/OVbD27XIiyzSIAXaiXl1zEQId0iJn
 EnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741699229; x=1742304029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jG32Oauz2hDV9q2BpFy552F2Ma60RDkGby0ei11tRlQ=;
 b=qeK6h0xhgp8O3OsPAfF3J41sLezfDdcQmIemlRwy+wz2c+bwCDQTm1tV2LfLclWtHe
 w5l3SNUQx7JW8yt5U/1X+gYBVGxX7a+diXAMFHzhzcvMMhcEOffr+mddGI0Mm0ADz8Wx
 BzolucT+qM+gtG2duzYoMiJgTFC4pop+Bia6usKnijXz88qBRIz9/ApWM2p74gzsMms5
 gjN3ce8Do4FxZ6kq4EwFL91JLVjD9GSybh73dzkVQI+IclM1VGUHEeDDx8J5nlB/xKib
 kaTouXwT60jBCis0rjQZLYkmimaZOhU3SI+6hjvqaKAEepOLlXA+Ukwx5inIXXiX+gry
 R4mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9tve0hqaTvVWYUr0dGTo1u+q0sCp/k1c1F+rr4YKPiQvKlaQ/U4pKe3mUK3El+NhDis/VrpWdA03z2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/TKrh7uaoeVyY1jtpwwxZj2fZJIoj1dafgCZW2uqHVP++CXCN
 hqKsl93ryV5Dbi40yfYfzWqeUV026lxn4iqn+cg3tyoopEL2RIj/kCfYBqA/wwB6lj6pvTmQcV4
 8yXXnsjnd1gPhqtxEhjddEiETi/w=
X-Gm-Gg: ASbGnctS3i5PO1dRNIgw78xqMPodqKthyu7f8q9fHs9KmTyYFeI8X67L6W6RKv5RIdS
 2hyFNxue3uYie919SPcTN4i48/eklez6FjQjiIzCBheJDmnYqMQmIgWGTO3A0/S8r3Pwe4CkffW
 1bzntbSP1tD41H2eIhbecSbgu3oA==
X-Google-Smtp-Source: AGHT+IH5Ot4qDEn+dcG95GX7rHERBDIZE9g/5SbpzTjYL9a5kZXtGTj07DwxdqUsxTS40Unad1vxI6B/ZQaIH1FxayY=
X-Received: by 2002:a05:6122:3d47:b0:523:dbd5:4e7f with SMTP id
 71dfb90a1353d-52419754983mr2351687e0c.3.1741699228735; Tue, 11 Mar 2025
 06:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <Z82tWYZulV12Pjir@shell.armlinux.org.uk>
 <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1trIA0-005ntK-FS@rmk-PC.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Mar 2025 13:20:02 +0000
X-Gm-Features: AQ5f1JrO_7vudADXigeeN9yXWooM4iHlgYUlKMy4_xyai_AoXvej3y5kzsc7Vh0
Message-ID: <CA+V-a8sCxs4MFZgo0q=0HmpyWXk7hYSGq0awm2YuAFZk+x6BEA@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Minda Chen <minda.chen@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/7] net: stmmac: allow platforms
 to use PHY tx clock stop capability
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

T24gU3VuLCBNYXIgOSwgMjAyNSBhdCAzOjAy4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxy
bWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4KPiBBbGxvdyBwbGF0Zm9ybSBnbHVl
IHRvIGluc3RydWN0IHN0bW1hYyB0byBtYWtlIHVzZSBvZiB0aGUgUEhZIHRyYW5zbWl0Cj4gY2xv
Y2sgc3RvcCBjYXBhYmlsaXR5IHdoZW4gZGVjaWRpbmcgd2hldGhlciB0byBhbGxvdyB0aGUgdHJh
bnNtaXQgY2xvY2sKPiBmcm9tIHRoZSBEV01BQyBjb3JlIHRvIGJlIHN0b3BwZWQuCj4KPiBDYzog
IkxhZCwgUHJhYmhha2FyIiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4K
PiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmggICAg
IHwgIDEgKwo+ICAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
ICAgfCAxNiArKysrKysrKysrKystLS0tCj4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICsrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2Fy
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWMuaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hYy5oCj4gaW5k
ZXggZDg3Mjc1YzFjZjIzLi5iZGRmYTBmNGFhMjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaAo+IEBAIC0zMDYsNiArMzA2LDcgQEAgc3RydWN0
IHN0bW1hY19wcml2IHsKPiAgICAgICAgIHN0cnVjdCB0aW1lcl9saXN0IGVlZV9jdHJsX3RpbWVy
Owo+ICAgICAgICAgaW50IGxwaV9pcnE7Cj4gICAgICAgICB1MzIgdHhfbHBpX3RpbWVyOwo+ICsg
ICAgICAgYm9vbCB0eF9scGlfY2xrX3N0b3A7Cj4gICAgICAgICBib29sIGVlZV9lbmFibGVkOwo+
ICAgICAgICAgYm9vbCBlZWVfYWN0aXZlOwo+ICAgICAgICAgYm9vbCBlZWVfc3dfdGltZXJfZW47
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFp
bi5jCj4gaW5kZXggZmExZDdkM2EyZjQzLi42ZjI5ODA0MTQ4YjYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtNDU3
LDggKzQ1Nyw3IEBAIHN0YXRpYyB2b2lkIHN0bW1hY190cnlfdG9fc3RhcnRfc3dfbHBpKHN0cnVj
dCBzdG1tYWNfcHJpdiAqcHJpdikKPiAgICAgICAgIC8qIENoZWNrIGFuZCBlbnRlciBpbiBMUEkg
bW9kZSAqLwo+ICAgICAgICAgaWYgKCFwcml2LT50eF9wYXRoX2luX2xwaV9tb2RlKQo+ICAgICAg
ICAgICAgICAgICBzdG1tYWNfc2V0X2xwaV9tb2RlKHByaXYsIHByaXYtPmh3LCBTVE1NQUNfTFBJ
X0ZPUkNFRCwKPiAtICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5wbGF0LT5mbGFncyAmIFNU
TU1BQ19GTEFHX0VOX1RYX0xQSV9DTE9DS0dBVElORywKPiAtICAgICAgICAgICAgICAgICAgICAg
ICAwKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcml2LT50eF9scGlf
Y2xrX3N0b3AsIDApOwo+ICB9Cj4KPiAgLyoqCj4gQEAgLTExMDQsMTMgKzExMDMsMTggQEAgc3Rh
dGljIGludCBzdG1tYWNfbWFjX2VuYWJsZV90eF9scGkoc3RydWN0IHBoeWxpbmtfY29uZmlnICpj
b25maWcsIHUzMiB0aW1lciwKPgo+ICAgICAgICAgcHJpdi0+ZWVlX2VuYWJsZWQgPSB0cnVlOwo+
Cj4gKyAgICAgICAvKiBVcGRhdGUgdGhlIHRyYW5zbWl0IGNsb2NrIHN0b3AgYWNjb3JkaW5nIHRv
IFBIWSBjYXBhYmlsaXR5IGlmCj4gKyAgICAgICAgKiB0aGUgcGxhdGZvcm0gYWxsb3dzCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIGlmIChwcml2LT5wbGF0LT5mbGFncyAmIFNUTU1BQ19GTEFHX0VO
X1RYX0xQSV9DTEtfUEhZX0NBUCkKPiArICAgICAgICAgICAgICAgcHJpdi0+dHhfbHBpX2Nsa19z
dG9wID0gdHhfY2xrX3N0b3A7Cj4gKwo+ICAgICAgICAgc3RtbWFjX3NldF9lZWVfdGltZXIocHJp
diwgcHJpdi0+aHcsIFNUTU1BQ19ERUZBVUxUX0xJVF9MUywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNUTU1BQ19ERUZBVUxUX1RXVF9MUyk7Cj4KPiAgICAgICAgIC8qIFRyeSB0byBj
bmZpZ3VyZSB0aGUgaGFyZHdhcmUgdGltZXIuICovCj4gICAgICAgICByZXQgPSBzdG1tYWNfc2V0
X2xwaV9tb2RlKHByaXYsIHByaXYtPmh3LCBTVE1NQUNfTFBJX1RJTUVSLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5wbGF0LT5mbGFncyAmIFNUTU1BQ19GTEFHX0VO
X1RYX0xQSV9DTE9DS0dBVElORywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpdi0+dHhfbHBpX3RpbWVyKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJpdi0+dHhfbHBpX2Nsa19zdG9wLCBwcml2LT50eF9scGlfdGltZXIpOwo+Cj4gICAgICAgICBp
ZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIC8qIEhhcmR3YXJlIHRpbWVyIG1vZGUgbm90IHN1
cHBvcnRlZCwgb3IgdmFsdWUgb3V0IG9mIHJhbmdlLgo+IEBAIC0xMjY5LDYgKzEyNzMsMTAgQEAg
c3RhdGljIGludCBzdG1tYWNfcGh5X3NldHVwKHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKPiAg
ICAgICAgIGlmICghKHByaXYtPnBsYXQtPmZsYWdzICYgU1RNTUFDX0ZMQUdfUlhfQ0xLX1JVTlNf
SU5fTFBJKSkKPiAgICAgICAgICAgICAgICAgcHJpdi0+cGh5bGlua19jb25maWcuZWVlX3J4X2Ns
a19zdG9wX2VuYWJsZSA9IHRydWU7Cj4KPiArICAgICAgIC8qIFNldCB0aGUgZGVmYXVsdCB0cmFu
c21pdCBjbG9jayBzdG9wIGJpdCBiYXNlZCBvbiB0aGUgcGxhdGZvcm0gZ2x1ZSAqLwo+ICsgICAg
ICAgcHJpdi0+dHhfbHBpX2Nsa19zdG9wID0gcHJpdi0+cGxhdC0+ZmxhZ3MgJgo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMT0NLR0FUSU5H
Owo+ICsKPiAgICAgICAgIG1kaW9fYnVzX2RhdGEgPSBwcml2LT5wbGF0LT5tZGlvX2J1c19kYXRh
Owo+ICAgICAgICAgaWYgKG1kaW9fYnVzX2RhdGEpCj4gICAgICAgICAgICAgICAgIHByaXYtPnBo
eWxpbmtfY29uZmlnLmRlZmF1bHRfYW5faW5iYW5kID0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9zdG1tYWMuaCBiL2luY2x1ZGUvbGludXgvc3RtbWFjLmgKPiBpbmRleCBiNmYwM2FiMTI1
OTUuLmM0ZWM4YmI4MTQ0ZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oCj4g
KysrIGIvaW5jbHVkZS9saW51eC9zdG1tYWMuaAo+IEBAIC0xODMsNyArMTgzLDggQEAgc3RydWN0
IGR3bWFjNF9hZGRycyB7Cj4gICNkZWZpbmUgU1RNTUFDX0ZMQUdfSU5UX1NOQVBTSE9UX0VOICAg
ICAgICAgICAgQklUKDkpCj4gICNkZWZpbmUgU1RNTUFDX0ZMQUdfUlhfQ0xLX1JVTlNfSU5fTFBJ
ICAgICAgICAgQklUKDEwKQo+ICAjZGVmaW5lIFNUTU1BQ19GTEFHX0VOX1RYX0xQSV9DTE9DS0dB
VElORyAgICAgIEJJVCgxMSkKPiAtI2RlZmluZSBTVE1NQUNfRkxBR19IV1RTVEFNUF9DT1JSRUNU
X0xBVEVOQ1kgICBCSVQoMTIpCj4gKyNkZWZpbmUgU1RNTUFDX0ZMQUdfRU5fVFhfTFBJX0NMS19Q
SFlfQ0FQICAgICAgQklUKDEyKQo+ICsjZGVmaW5lIFNUTU1BQ19GTEFHX0hXVFNUQU1QX0NPUlJF
Q1RfTEFURU5DWSAgIEJJVCgxMykKPgo+ICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgewo+
ICAgICAgICAgaW50IGJ1c19pZDsKPiAtLQo+IDIuMzAuMgo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
