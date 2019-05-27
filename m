Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C12B20A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 12:22:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8973C5AB79
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 10:22:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6F17C5AB78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 10:22:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RAGdv9031349; Mon, 27 May 2019 12:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=ixDf88IcNb3TU6tNgq8bjWEyDdaEJ144CZTxviT3UTE=;
 b=ff8ILc4ioPMsKqkyweSlcBLsWP3MVx7APoWrr8IMFcUnhQbUOuM2cSK01jfzckrRQ1P3
 zPxU1nT7zO+zDGVsWWXKJFTD44GvrXet2j92zvpt0KVP6IL0QAnCbl5Amb26cx42FGLn
 PnlqIWbZ84Axixb93FC6KYocoPJ2V8J0yTda2eYpj2dsn1y0LZVIYqYknBlaWeJ0vI0c
 t/pm1I8WOT1U82e2h4eiizrCIWdso8nk3tmOCxkrl471FgxRc9gKBFos8alVZkxI10f8
 7FVl3dipDCqPhYVREzJd6YTFhU8UyVGdDuwpuhxNGoBAjXytNIT4M4SHcpZSNNJVDlNS kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sptu9jjhg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 12:21:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 636BB31;
 Mon, 27 May 2019 10:21:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 347112804;
 Mon, 27 May 2019 10:21:46 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 12:21:46 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 12:21:45
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 Yannick Fertre <yannick.fertre@st.com>, Nickey
 Yang <nickey.yang@rock-chips.com>, Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou
 <vincent.abriou@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 27 May 2019 12:21:37 +0200
Message-ID: <1558952499-15418-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Subject: [Linux-stm32] [PATCH v1 0/2] dw-mipi-dsi: add power on & off
	optional phy ops and update stm
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

VGhlc2UgcGF0Y2hlcyBmaXggYSBidWcgY29uY2VybmluZyBhbiBhY2Nlc3MgaXNzdWUgdG8gZGlz
cGxheSBjb250cm9sZXIgKGx0ZGMpCnJlZ2lzdGVycy4KSWYgdGhlIHBoeXNpY2FsIGxheWVyIG9m
IHRoZSBEU0kgaXMgc3RhcnRlZCB0b28gZWFybHkgdGhlbiB0aGUgZmlmbyBEU0kgYXJlIGZ1bGwK
dmVyeSBxdWlja2x5IHdoaWNoIGltcGxpZXMgbHRkYyByZWdpc3RlcidzIGFjY2VzcyBoYW5nIHVw
LiBUbyBhdm9pZCB0aGlzCnByb2JsZW0sIGl0IGlzIG5lY2Vzc2FyeSB0byBzdGFydCB0aGUgRFNJ
IHBoeXNpY2FsIGxheWVyIG9ubHkgd2hlbiB0aGUgYnJpZGdlCmlzIGVuYWJsZS4KCllhbm5pY2sg
RmVydHLDqSAoMik6CiAgZHJtL2JyaWRnZS9zeW5vcHN5czogZHNpOiBhZGQgcG93ZXIgb24vb2Zm
IG9wdGlvbmFsIHBoeSBvcHMKICBkcm0vc3RtOiBkc2k6IGFkZCBwb3dlciBvbi9vZmYgcGh5IG9w
cwoKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8ICA4ICsr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jICAgICAgICAgfCAy
MSArKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19taXBpX2RzaS5o
ICAgICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
