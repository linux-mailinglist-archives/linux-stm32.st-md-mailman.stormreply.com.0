Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0251EF741
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 14:25:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D5E1C36B22;
	Fri,  5 Jun 2020 12:25:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7708AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 12:25:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 210A8207D5;
 Fri,  5 Jun 2020 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591359923;
 bh=jm6x0RRvrOOaubi6Ix7xcoeaXwJB5qwx91pe4/tNY94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1lkvJca1AnWOFu1AJROaGIlW0WmR4izYgJGm+6k+0RCTiiYAViJjPKVA102jEjFc/
 tKxIwMDdfFsRo/TML8t2EiDB6tRrlaVQmXZtv1ZmtihuwZTtx9KkxO3PBGp7dMfP6+
 ojBB61UUSFhmabKDQ4Zljy8IOhBt6fsoEPmL8VEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  5 Jun 2020 08:25:04 -0400
Message-Id: <20200605122517.2882338-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605122517.2882338-1-sashal@kernel.org>
References: <20200605122517.2882338-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Fugang Duan <fugang.duan@nxp.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.6 05/17] net: stmmac: enable
	timestamp snapshot for required PTP packets in dwmac v5.10a
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

RnJvbTogRnVnYW5nIER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCBmMmZiNmI2Mjc1ZWJhOWQzMTI5NTdjYTQ0YzQ4N2JkNzgwZGE2MTY5IF0KCkZvciByeCBmaWx0
ZXIgJ0hXVFNUQU1QX0ZJTFRFUl9QVFBfVjJfRVZFTlQnLCBpdCBzaG91bGQgYmUKUFRQIHYyLzgw
Mi5BUzEsIGFueSBsYXllciwgYW55IGtpbmQgb2YgZXZlbnQgcGFja2V0LCBidXQgSFcgb25seQp0
YWtlIHRpbWVzdGFtcCBzbmFwc2hvdCBmb3IgYmVsb3cgUFRQIG1lc3NhZ2U6IHN5bmMsIFBkZWxh
eV9yZXEsClBkZWxheV9yZXNwLgoKVGhlbiBpdCBjYXVzZXMgYmVsb3cgaXNzdWUgd2hlbiB0ZXN0
IEUyRSBjYXNlOgpwdHA0bFsyNDc5LjUzNF06IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlfUkVRIHdp
dGhvdXQgdGltZXN0YW1wCnB0cDRsWzI0ODEuNDIzXTogcG9ydCAxOiByZWNlaXZlZCBERUxBWV9S
RVEgd2l0aG91dCB0aW1lc3RhbXAKcHRwNGxbMjQ4MS43NThdOiBwb3J0IDE6IHJlY2VpdmVkIERF
TEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcApwdHA0bFsyNDgzLjUyNF06IHBvcnQgMTogcmVjZWl2
ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wCnB0cDRsWzI0ODQuMjMzXTogcG9ydCAxOiBy
ZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXAKcHRwNGxbMjQ4NS43NTBdOiBwb3J0
IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcApwdHA0bFsyNDg2Ljg4OF06
IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wCnB0cDRsWzI0ODcu
MjY1XTogcG9ydCAxOiByZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXAKcHRwNGxb
MjQ4Ny4zMTZdOiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcAoK
VGltZXN0YW1wIHNuYXBzaG90IGRlcGVuZGVuY3kgb24gcmVnaXN0ZXIgYml0cyBpbiByZWNlaXZl
ZCBwYXRoOgpTTkFQVFlQU0VMIFRTTVNUUkVOQSBUU0VWTlRFTkEgCVBUUF9NZXNzYWdlcwowMSAg
ICAgICAgIHggICAgICAgICAwICAgICAgICAgIFNZTkMsIEZvbGxvd19VcCwgRGVsYXlfUmVxLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERlbGF5X1Jlc3AsIFBkZWxheV9SZXEsIFBk
ZWxheV9SZXNwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBkZWxheV9SZXNwX0Zv
bGxvd19VcAowMSAgICAgICAgIDAgICAgICAgICAxICAgICAgICAgIFNZTkMsIFBkZWxheV9SZXEs
IFBkZWxheV9SZXNwCgpGb3IgZHdtYWMgdjUuMTBhLCBlbmFibGluZyBhbGwgZXZlbnRzIGJ5IHNl
dHRpbmcgcmVnaXN0ZXIKRFdDX0VRT1NfVElNRV9TVEFNUElOR1tTTkFQVFlQU0VMXSB0byAy4oCZ
YjAxLCBjbGVhcmluZyBiaXQgW1RTRVZOVEVOQV0KdG8gMOKAmWIwLCB3aGljaCBjYW4gc3VwcG9y
dCBhbGwgcmVxdWlyZWQgZXZlbnRzLgoKU2lnbmVkLW9mZi1ieTogRnVnYW5nIER1YW4gPGZ1Z2Fu
Zy5kdWFuQG54cC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2
ZW1sb2Z0Lm5ldD4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
CmluZGV4IGQ1NjQ0NTkyOTBjZS4uYmNiMzkwMTJkMzRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCisrKyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKQEAgLTYzMCw3ICs2MzAsOCBA
QCBzdGF0aWMgaW50IHN0bW1hY19od3RzdGFtcF9zZXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwg
c3RydWN0IGlmcmVxICppZnIpCiAJCQljb25maWcucnhfZmlsdGVyID0gSFdUU1RBTVBfRklMVEVS
X1BUUF9WMl9FVkVOVDsKIAkJCXB0cF92MiA9IFBUUF9UQ1JfVFNWRVIyRU5BOwogCQkJc25hcF90
eXBlX3NlbCA9IFBUUF9UQ1JfU05BUFRZUFNFTF8xOwotCQkJdHNfZXZlbnRfZW4gPSBQVFBfVENS
X1RTRVZOVEVOQTsKKwkJCWlmIChwcml2LT5zeW5vcHN5c19pZCAhPSBEV01BQ19DT1JFXzVfMTAp
CisJCQkJdHNfZXZlbnRfZW4gPSBQVFBfVENSX1RTRVZOVEVOQTsKIAkJCXB0cF9vdmVyX2lwdjRf
dWRwID0gUFRQX1RDUl9UU0lQVjRFTkE7CiAJCQlwdHBfb3Zlcl9pcHY2X3VkcCA9IFBUUF9UQ1Jf
VFNJUFY2RU5BOwogCQkJcHRwX292ZXJfZXRoZXJuZXQgPSBQVFBfVENSX1RTSVBFTkE7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
