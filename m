Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A7116F58
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2019 15:44:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16454C36B0B;
	Mon,  9 Dec 2019 14:44:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98A7CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2019 14:44:08 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9Egjpg017551; Mon, 9 Dec 2019 15:43:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vKx6OPdSeYJTuRGa0bHCD2tYSeg+UtY9A3haTmI2eKA=;
 b=c6ntOlc126VLKeqyu4GAC4nsRoo7L/y/wpleFu9k1K+1s90MlQADGV2W+omSCJCO3CvN
 EyJtnea6Ee3WS9nY/7HUgXOMnAg1Q+E2DGu5F7gHrOtsvZ9pbKRa3nD5kYUmbOR5pt2x
 ah1hkDXaCytdccqyyaH++WgfekYbeVLs76peteDiSzhFC/LaCP31IocckHdvEOA/Xx+X
 Aa4o3Nhws5Np5oqMvE85guQd3c5PJmv/Jwvm91G2SGNdt+7tbr0awKQOFHZkDxxT2G+A
 T6soWnVEfm7PhN1YgDLqZuruHnHt+7AcTziV0LU+HJ8+ZRhQE465zo4K4C/C5hBq7fKu vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wradh7xe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 15:43:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C39910002A;
 Mon,  9 Dec 2019 15:43:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CA812D3765;
 Mon,  9 Dec 2019 15:43:51 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 9 Dec
 2019 15:43:50 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
References: <20191121161259.25799-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <181a4a40-f54c-3559-aaa9-9443fb2153ac@st.com>
Date: Mon, 9 Dec 2019 15:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121161259.25799-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_04:2019-12-09,2019-12-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: add phy-names to
 usbotg_hs on stm32mp157c-ev1
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

SGkgQW3DqWxpZSwKCk9uIDExLzIxLzE5IDU6MTIgUE0sIEFtZWxpZSBEZWxhdW5heSB3cm90ZToK
PiBwaHktbmFtZXMgaXMgcmVxdWlyZWQgYnkgdXNib3RnX2hzIGRyaXZlciB0byBnZXQgdGhlIHBo
eSwgb3RoZXJ3aXNlLCBpdAo+IGNvbnNpZGVycyB0aGF0IHRoZXJlIGlzIG5vIHBoeXMgcHJvcGVy
dHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlA
c3QuY29tPgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cyB8
IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCj4gaW5kZXggMjAxMGY2MjkyYTc3Li4yMjhlMzVlMTY4ODQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cwo+ICsr
KyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMKPiBAQCAtMzU1LDYgKzM1
NSw3IEBACj4gICAmdXNib3RnX2hzIHsKPiAgIAlkcl9tb2RlID0gInBlcmlwaGVyYWwiOwo+ICAg
CXBoeXMgPSA8JnVzYnBoeWNfcG9ydDEgMD47Cj4gKwlwaHktbmFtZXMgPSAidXNiMi1waHkiOwo+
ICAgCXN0YXR1cyA9ICJva2F5IjsKPiAgIH07Cj4gICAKPiAKCgpTZXJpZXMgYXBwbGllZCBvbiBz
dG0zMi1uZXh0LgoKTm90ZTogZHVlIHRvIG5ldyBTVE0zMiBkaXZlcnNpdHkgSSByZW5hbWVkIHNv
bWUgcGF0Y2hlcy4KClJlZ2FyZHMKQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
