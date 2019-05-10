Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436619EF3
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 16:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 422C6C712BF
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 14:20:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 266DEC712BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 14:20:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE1mfQ025399; Fri, 10 May 2019 16:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=/XRL/cLbUyuiOX7oZ//xMTlD4EbxIiDLjZE+ThQcnls=;
 b=PTQbnLjW+4cIwTlZRJQ7M0JJ7VWQbIjead4RnKIdGrVSe9FJJQ8PnLpnJSm/Qr32Czxg
 hgrSy9SitxnMH9jMvP0ClqBFdU2LVSPBfYufiyTj24AyQQ4NrGs5dWtTt4b2qcJlfIYt
 TPzmiyWddvuHizI++YI5XvYZj1ytzxVnKHzWs2oryLmk2vK0+8bmlMLqK4isEMLICTKM
 uUdjt+CCaOXjHzT/F4Anv9raBFZIU622NfqrtAdW5KXuFgMtA1/06K868iJleupRSndk
 S91rnNrtYH73E1HpwdqAfSbFHYAZn8Kzdf/kq6U+KWpmStGDdfMVFIAej9vaukOhGKr7 Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2s5w5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 958323D;
 Fri, 10 May 2019 14:20:33 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 754F5113A;
 Fri, 10 May 2019 14:20:33 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 16:20:33 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:32
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 10 May 2019 16:20:22 +0200
Message-ID: <1557498023-10766-5-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: [Linux-stm32] [PATCH v2 4/5] ARM: dts: stm32: move fixe regulators
	reg11 & reg18
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

TW92ZSByZWd1bGF0b3JzIHJlZzExICYgcmVnMTggZnJvbSBkZXZpY2UtdHJlZSBmaWxlcyBzdG0z
Mm1wMTU3Yy1lZDEuZHRzCiYgc3RtMzJtcDE1N2MtZGsyLmR0cyB0byBmaWxlIHN0bTMybXAxNTdj
LmR0c2kuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0
LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzIHwgIDggLS0t
LS0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHMgfCAxNiAtLS0tLS0t
LS0tLS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpICAgIHwgMTYgKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIu
ZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwppbmRleCAyMGVhNjAx
Li4wMjBlYTBmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIu
ZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi5kdHMKQEAgLTExLDE0
ICsxMSw2IEBACiAvIHsKIAltb2RlbCA9ICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDE1N0Mt
REsyIERpc2NvdmVyeSBCb2FyZCI7CiAJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTU3Yy1kazIi
LCAic3Qsc3RtMzJtcDE1NyI7Ci0KLQlyZWcxODogcmVnMTggewotCQljb21wYXRpYmxlID0gInJl
Z3VsYXRvci1maXhlZCI7Ci0JCXJlZ3VsYXRvci1uYW1lID0gInJlZzE4IjsKLQkJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47Ci0JCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0g
PDE4MDAwMDA+OwotCQlyZWd1bGF0b3ItYWx3YXlzLW9uOwotCX07CiB9OwogCiAmZHNpIHsKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHMgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEuZHRzCmluZGV4IDYyYThjNzguLmY0MTE4OWMgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHMKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZWQxLmR0cwpAQCAtMjcsMjIgKzI3LDYgQEAKIAkJ
c2VyaWFsMCA9ICZ1YXJ0NDsKIAl9OwogCi0JcmVnMTE6IHJlZzExIHsKLQkJY29tcGF0aWJsZSA9
ICJyZWd1bGF0b3ItZml4ZWQiOwotCQlyZWd1bGF0b3ItbmFtZSA9ICJyZWcxMSI7Ci0JCXJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDExMDAwMDA+OwotCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwxMTAwMDAwPjsKLQkJcmVndWxhdG9yLWFsd2F5cy1vbjsKLQl9OwotCi0JcmVnMTg6IHJl
ZzE4IHsKLQkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwotCQlyZWd1bGF0b3ItbmFt
ZSA9ICJyZWcxOCI7Ci0JCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+OwotCQly
ZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKLQkJcmVndWxhdG9yLWFsd2F5cy1v
bjsKLQl9OwotCiAJc2Rfc3dpdGNoOiByZWd1bGF0b3Itc2Rfc3dpdGNoIHsKIAkJY29tcGF0aWJs
ZSA9ICJyZWd1bGF0b3ItZ3BpbyI7CiAJCXJlZ3VsYXRvci1uYW1lID0gInNkX3N3aXRjaCI7CmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaQppbmRleCA2YjE0ZjFlLi5hYWFjNTFjZCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaQorKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpCkBAIC0xMSw2ICsxMSwyMiBAQAogCSNhZGRyZXNzLWNl
bGxzID0gPDE+OwogCSNzaXplLWNlbGxzID0gPDE+OwogCisJcmVnMTE6IHJlZzExIHsKKwkJY29t
cGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1bGF0b3ItbmFtZSA9ICJyZWcxMSI7
CisJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDExMDAwMDA+OworCQlyZWd1bGF0b3ItbWF4
LW1pY3Jvdm9sdCA9IDwxMTAwMDAwPjsKKwkJcmVndWxhdG9yLWFsd2F5cy1vbjsKKwl9OworCisJ
cmVnMTg6IHJlZzE4IHsKKwkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOworCQlyZWd1
bGF0b3ItbmFtZSA9ICJyZWcxOCI7CisJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAw
MDA+OworCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsKKwkJcmVndWxhdG9y
LWFsd2F5cy1vbjsKKwl9OworCiAJY3B1cyB7CiAJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwogCQkj
c2l6ZS1jZWxscyA9IDwwPjsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
