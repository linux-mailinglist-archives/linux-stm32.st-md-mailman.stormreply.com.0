Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D6F397059
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 11:27:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD5CAC57B5A;
	Tue,  1 Jun 2021 09:27:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3DA0C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 09:27:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1519QRn8002805; Tue, 1 Jun 2021 11:27:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BsDpJoLHvDvSIYjWJaYxAmYm+9EbdYsJJXc+10150Fk=;
 b=PfDoER9oXuNCgWnYOKszZTpqmVokmPoa8D1Jpn4V6CVbfgjTgDQwYXVn26WmZ2HFbcC0
 XY37NKR73VVnTZfrI9klV4NA6eQ2fsI1qACyqsQL1GbNE46lfgJa/vgn+VW9lSp9PMh+
 65FkfwCs8Xn/7NeHtwk5R/dPbbI58ne+p8RvO7ld1qE5udyAt1m1+foemK3Zkbe/lztp
 56JbDSPxQcQMd51CgeVPYSr3KEeGR5HKXrHwGlraeaglWDZrQ8N6ruCmyj9GbJgekpEX
 r+PV6MmDl9/67kCCeq/ZkGxmfPI8T0jXjd4fg30rBllmJMh795rWGG75yQa7SPsyYOHi gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38w49ckk1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 11:27:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E55F210002A;
 Tue,  1 Jun 2021 11:27:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE7D4218112;
 Tue,  1 Jun 2021 11:27:04 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 11:27:04 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>
References: <YHH9+Xrn5Quge4Jt@nx64de-df6d00>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <74029811-6417-7c0b-1abd-6ea15de7f1ae@foss.st.com>
Date: Tue, 1 Jun 2021 11:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YHH9+Xrn5Quge4Jt@nx64de-df6d00>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marcin_S=c5=82oniewski?= <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix stm32mp157c-odyssey
	card detect pin
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

T24gNC8xMC8yMSA5OjM1IFBNLCBHcnplZ29yeiBTenltYXN6ZWsgd3JvdGU6Cj4gVGhlIG1pY3Jv
U0QgY2FyZCBkZXRlY3QgcGluIGlzIHBoeXNpY2FsbHkgY29ubmVjdGVkIHRvIHRoZSBNUFUgcGlu
IFBJMy4KPiBUaGUgRGV2aWNlIFRyZWUgY29uZmlndXJhdGlvbiBvZiB0aGUgY2FyZCBkZXRlY3Qg
cGluIHdhcyB3cm9uZ+KAlGl0IHdhcwo+IHNldCB0byBwaW4gUEI3IGluc3RlYWQuIElmIHN1Y2gg
Y29uZmlndXJhdGlvbiB3YXMgdXNlZCwgdGhlIGtlcm5lbCB3b3VsZAo+IGhhbmcgb24g4oCcV2Fp
dGluZyBmb3Igcm9vdCBkZXZpY2XigJ0gd2hlbiBib290aW5nIGZyb20gYSBtaWNyb1NEIGNhcmQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogR3J6ZWdvcnogU3p5bWFzemVrIDxnc3p5bWFzemVrQHNob3J0
LnBsPgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5kdHMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS5k
dHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LmR0cwo+IGluZGV4IGE3
ZmZlYzhmMTUxNi4uYmUxZGQ1ZTllNzQ0IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLW9keXNzZXkuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1N2Mtb2R5c3NleS5kdHMKPiBAQCAtNjQsNyArNjQsNyBAQCAmc2RtbWMxIHsKPiAgIAlwaW5j
dHJsLTAgPSA8JnNkbW1jMV9iNF9waW5zX2E+Owo+ICAgCXBpbmN0cmwtMSA9IDwmc2RtbWMxX2I0
X29kX3BpbnNfYT47Cj4gICAJcGluY3RybC0yID0gPCZzZG1tYzFfYjRfc2xlZXBfcGluc19hPjsK
PiAtCWNkLWdwaW9zID0gPCZncGlvYiA3IChHUElPX0FDVElWRV9MT1cgfCBHUElPX1BVTExfVVAp
PjsKPiArCWNkLWdwaW9zID0gPCZncGlvaSAzIChHUElPX0FDVElWRV9MT1cgfCBHUElPX1BVTExf
VVApPjsKPiAgIAlkaXNhYmxlLXdwOwo+ICAgCXN0LG5lZy1lZGdlOwo+ICAgCWJ1cy13aWR0aCA9
IDw0PjsKPiAKCkhpIEdyemVnb3J6CgpBcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpUaGFua3MuCkFs
ZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
