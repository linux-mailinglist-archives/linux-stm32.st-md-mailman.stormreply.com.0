Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA39F0A13
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 11:51:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C222C78006;
	Fri, 13 Dec 2024 10:51:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53D2BC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 10:51:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAW5Gf002214;
 Fri, 13 Dec 2024 11:51:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 G5uSC3BK+YvGUsKSKx/YNrD4AlAFZtoOKclTkZr6p54=; b=V59d/Tcak9U2dgRH
 IieiSNH5E9xkRhqCZH3nlT4/henx+nxTNXz4bglJg5tdoBYQs5nEMOhEAe0Zszq8
 mev4UqwhRvA5G2uSm+THWcdqbkuELoqDsTb83kCYc9RqkbowUg1vPnKVJJfgtcwe
 tIGMNxFh+U23kxQp1U1o3B0d/3ae+idNFqs85362zq3BZVamCxiwvctJV9iMomP+
 +/5TGY7nLZL0k44sSR/4D1pA66lXhlKIXOQejNNmjKMfY+x+a418pD6J7XToKZeV
 EEqn0RsO+wpR1U0X5jbe06mfIBz83J3Q/JYzlBdoBhMya+eaifghcKKP3XkNGATA
 BK3MZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj75wr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 11:51:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6D82F40056;
 Fri, 13 Dec 2024 11:50:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C4BA268D8B;
 Fri, 13 Dec 2024 11:49:30 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 11:49:29 +0100
Date: Fri, 13 Dec 2024 11:49:24 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Message-ID: <20241213104924.GA3662210@gnbcxd0016.gnb.st.com>
References: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213060011.67797-1-lukas.bulwahn@redhat.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: repair file entry in MEDIA
 DRIVERS FOR STM32 - CSI
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

SGkgTHVrYXMsCgpJbmRlZWQsIHRoYW5rIHlvdSBmb3IgdGhlIGZpeC4KClJldmlld2VkLWJ5OiBB
bGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbT4KClJlZ2FyZHMsCkFsYWluCgpP
biBGcmksIERlYyAxMywgMjAyNCBhdCAwNzowMDoxMUFNICswMTAwLCBMdWthcyBCdWx3YWhuIHdy
b3RlOgo+IEZyb206IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AcmVkaGF0LmNvbT4KPiAK
PiBDb21taXQgZGNiMGY0YzE2YmU1ICgibWVkaWE6IHN0bTMyOiBjc2k6IGFkZGl0aW9uIG9mIHRo
ZSBTVE0zMiBDU0kgZHJpdmVyIikKPiBhZGRzIGEgbmV3IGRyaXZlciBhdCBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWNzaS5jLCBidXQKPiBjcmVhdGVzIGEgbmV3IE1BSU5U
QUlORVJTIHNlY3Rpb24gTUVESUEgRFJJVkVSUyBGT1IgU1RNMzIgLSBDU0kgd2l0aCBhIGZpbGUK
PiBlbnRyeSBwb2ludGluZyB0byBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNz
aS5jLiBOb3RlIHRoYXQgdGhlCj4gZmlsZSBlbnRyeSBpcyBtaXNzaW5nIHRoZSDigJhzdOKAmSBk
aXJlY3RvcnkgaW4gaXRzIHBhdGguCj4gCj4gSGVuY2UsIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5l
ci5wbCAtLXNlbGYtdGVzdD1wYXR0ZXJucyBjb21wbGFpbnMgYWJvdXQgYQo+IGJyb2tlbiByZWZl
cmVuY2UuIFJlcGFpciB0aGlzIGZpbGUgZW50cnkgaW4gTUVESUEgRFJJVkVSUyBGT1IgU1RNMzIg
LSBDU0kuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgQnVsd2FobiA8bHVrYXMuYnVsd2FobkBy
ZWRoYXQuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBiZmYzZDM1ZjgwYjUuLjIzMGI3YTRlZTk1ZiAxMDA2
NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTE0NTUxLDcg
KzE0NTUxLDcgQEAgTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gIFM6CVN1cHBvcnRl
ZAo+ICBUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQKPiAgRjoJRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMybXAyNS1jc2kueWFtbAo+
IC1GOglkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNzaS5jCj4gK0Y6CWRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItY3NpLmMKPiAgCj4gIE1FRElBIERSSVZF
UlMgRk9SIFNUTTMyIC0gRENNSSAvIERDTUlQUAo+ICBNOglIdWd1ZXMgRnJ1Y2hldCA8aHVndWVz
LmZydWNoZXRAZm9zcy5zdC5jb20+Cj4gLS0gCj4gMi40Ny4xCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
