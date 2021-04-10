Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3BB35C56B
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 13:38:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7F25C57B75;
	Mon, 12 Apr 2021 11:38:56 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87954C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Apr 2021 19:35:38 +0000 (UTC)
Received: from [192.168.192.146] (port=42076 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lVJO6-0006x5-S6; Sat, 10 Apr 2021 21:35:23 +0200
Date: Sat, 10 Apr 2021 21:35:21 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
Message-ID: <YHH9+Xrn5Quge4Jt@nx64de-df6d00>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 12 Apr 2021 11:38:54 +0000
Cc: devicetree@vger.kernel.org, Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Marcin =?utf-8?Q?S=C5=82oniewski?= <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix stm32mp157c-odyssey card
	detect pin
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

VGhlIG1pY3JvU0QgY2FyZCBkZXRlY3QgcGluIGlzIHBoeXNpY2FsbHkgY29ubmVjdGVkIHRvIHRo
ZSBNUFUgcGluIFBJMy4KVGhlIERldmljZSBUcmVlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGNhcmQg
ZGV0ZWN0IHBpbiB3YXMgd3JvbmfigJRpdCB3YXMKc2V0IHRvIHBpbiBQQjcgaW5zdGVhZC4gSWYg
c3VjaCBjb25maWd1cmF0aW9uIHdhcyB1c2VkLCB0aGUga2VybmVsIHdvdWxkCmhhbmcgb24g4oCc
V2FpdGluZyBmb3Igcm9vdCBkZXZpY2XigJ0gd2hlbiBib290aW5nIGZyb20gYSBtaWNyb1NEIGNh
cmQuCgpTaWduZWQtb2ZmLWJ5OiBHcnplZ29yeiBTenltYXN6ZWsgPGdzenltYXN6ZWtAc2hvcnQu
cGw+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9keXNzZXkuZHRzCmluZGV4IGE3ZmZlYzhmMTUxNi4uYmUx
ZGQ1ZTllNzQ0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlz
c2V5LmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0cwpA
QCAtNjQsNyArNjQsNyBAQCAmc2RtbWMxIHsKIAlwaW5jdHJsLTAgPSA8JnNkbW1jMV9iNF9waW5z
X2E+OwogCXBpbmN0cmwtMSA9IDwmc2RtbWMxX2I0X29kX3BpbnNfYT47CiAJcGluY3RybC0yID0g
PCZzZG1tYzFfYjRfc2xlZXBfcGluc19hPjsKLQljZC1ncGlvcyA9IDwmZ3Bpb2IgNyAoR1BJT19B
Q1RJVkVfTE9XIHwgR1BJT19QVUxMX1VQKT47CisJY2QtZ3Bpb3MgPSA8JmdwaW9pIDMgKEdQSU9f
QUNUSVZFX0xPVyB8IEdQSU9fUFVMTF9VUCk+OwogCWRpc2FibGUtd3A7CiAJc3QsbmVnLWVkZ2U7
CiAJYnVzLXdpZHRoID0gPDQ+OwotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
