Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7048DCCD
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jan 2022 18:20:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15068C5F1FF;
	Thu, 13 Jan 2022 17:20:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88DFEC5C82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jan 2022 17:20:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20DCTnGQ024245;
 Thu, 13 Jan 2022 18:20:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=toNwEi+iywkGzWNpim3RHW1l83fPbcMs07ZSO0fJ5d4=;
 b=0EzYTP7uVupL6z7KwopEskrLkt6spRvqCYr+HGpesyhVCzCwVtX3EHN9I5g1ypkpEm6l
 ccRHSGxF6Y4OnqZulduq+tJ+oVy58mEd16BhlH7a5UaHqNuc6wxKJbIL1kmFbcbMQneF
 vf/agm2dOGrSjKJP36jR70ysDlR1v+gXNYvEU16dvBVDWQLQpkcFbLFHpmGO5v2BIT4L
 OQOSjAkCnJZrZWbVLZMeg+G5y5AD5YmT+5fdZ64429din7a1HbpkSpROqN6HrBhNPZ29
 hisg3s8RUYkBpBan8p45xNU64/UoEunHQFY04/m8SgLmo0VP94+6v4nhdrsb3xybpJfh Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3djfywtwk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 18:20:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3114F10002A;
 Thu, 13 Jan 2022 18:20:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26C462194DA;
 Thu, 13 Jan 2022 18:20:19 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 13 Jan 2022 18:20:18
 +0100
From: Philippe Cornu <philippe.cornu@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark
 <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, Christian
 Konig <christian.koenig@amd.com>, <soc@kernel.org>
Date: Thu, 13 Jan 2022 18:19:21 +0100
Message-ID: <20220113171921.17466-3-philippe.cornu@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113171921.17466-1-philippe.cornu@foss.st.com>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_08,2022-01-13_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] MAINTAINERS: update drm/stm drm/sti and
	cec/sti maintainers
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

QWRkIEFsYWluIGFzIHN0aSBtYWludGFpbmVyIGZvciBib3RoIGRybS9zdGkgJiBjZWMvc3RpLgpB
ZGQgUmFwaGHDq2wgYXMgc3RtIG1haW50YWluZXIgZm9yIGRybS9zdG0uCgpTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Ci0tLQogTUFJTlRB
SU5FUlMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNmJlYTA4MGQwMTU5Li43MDhmOGM4
NmU0YzkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC02NDIz
LDYgKzY0MjMsNyBAQCBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yb2NrY2hpcC8KIEY6CWRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC8KIAogRFJNIERSSVZFUlMg
Rk9SIFNUSQorTToJQWxhaW4gVm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+CiBMOglk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiBTOglNYWludGFpbmVkCiBUOglnaXQgZ2l0
Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCkBAIC02NDMxLDYgKzY0MzIs
NyBAQCBGOglkcml2ZXJzL2dwdS9kcm0vc3RpCiAKIERSTSBEUklWRVJTIEZPUiBTVE0KIE06CVlh
bm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KK006CVJhcGhhZWwgR2Fs
bGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CiBNOglQaGlsaXBwZSBD
b3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+CiBMOglkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCiBTOglNYWludGFpbmVkCkBAIC0xODE1Miw2ICsxODE1NCw3IEBAIEY6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdGktYXNvYy1jYXJkLnR4
dAogRjoJc291bmQvc29jL3N0aS8KIAogU1RJIENFQyBEUklWRVIKK006CUFsYWluIFZvbG1hdCA8
YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPgogUzoJTWFpbnRhaW5lZAogRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0aWgtY2VjLnR4dAogRjoJZHJpdmVycy9tZWRp
YS9jZWMvcGxhdGZvcm0vc3RpLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
