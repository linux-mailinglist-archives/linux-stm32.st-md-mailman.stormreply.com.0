Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678C27F950
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 08:11:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D645C424B1;
	Thu,  1 Oct 2020 06:11:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0165C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 23:47:32 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBDrM-1kGeY90zPi-00CgJ0; Thu, 01 Oct 2020 01:47:23 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlod-0007Z0-T1; Thu, 01 Oct 2020 01:47:21 +0200
Received: (nullmailer pid 7728 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:19 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Date: Thu,  1 Oct 2020 01:46:31 +0200
Message-Id: <20200930234637.7573-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 257374c4a781fc070d55e21f439eb91a
X-Spam-Score: -2.8 (--)
X-Provags-ID: V03:K1:jOBjAF/CkF48hBbOCUr5Z1QgpCLc02GeaEYNbCwJ99PA1LLbkiZ
 xHzp1rqs9sSPt1xHxyhq4jLizqlO9LFAw++h6YE0LN//pXOKbLHkKBiiiGwmFPlz7CdFDLg
 JNaqS1r+44GEpZCiXEfTEmJDd8Qp1ji40AAzKG+i3m1nCi1cNdsx/EgsVuJ4zuovoJNDa6y
 dgbxd+LBEval1wn5/02LQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSF88Ru63gE=:fVUBUUaVYcOB8FBvPO/ppG
 wJ59KSFdKkPsDDQGJulkZ5RoXmTDDno1WSs/s35+AqRr9FKp6arQHplZDE21a7pYiwtgllW5f
 Iz4fjCCTRN5u17zN4sswYwd+eQqtN0wgC/GeJh3iLP/0u7qw9IliGjLSWXZEvbFjKpT4W71Yy
 y6DigH3OgpQzKihT4hSu5Rz2tBRCkajY8u0zKaU9Qm0kDCY8uL3qQ4qU49vq11zwA1uxz0be9
 0gA0tBAVQrEaH2Azi1eiQnDL29uTWE3NUyVa91wMRJuqeQfQnJEcGqUYRH99H+ID+iZx2UXSX
 135mff55LNYdB51u1Q8ewbc69X7R3jejwgV/oS2uVMU78KzrzBTPIDiP2/CYmBmNq2ROPQN+X
 rlPaV8YVwJlkzpzfhycj/dy/sJKJONYJuqi80chS0VIIOpvElOpa9C4g99xISgXTnT+g++y8o
 5MVXRv3HFv3re8X4xU87/qXhDSz4cI5Xd4cXj0LkejP52cP0NQEAdDpu7n27WbzFRAicuHyJQ
 JGGQJMnjBQjuYqBEdAIpw0g7UvhNi6+AYteUj6D+eI7eMe4mO/iC/OwZhz/xBQFu5swmtmxp+
 37JYjxZeCRLfQXSso6sY76nyyu7+MaJR4QtOW/dzjgI61Rg8hjgO78AGQAVBKNbDqMDnegHGA
 v21NWOYBOO+ELiQ75QGMhBDYJyheeAhgj7KgZlT/crfVomMf/89fWO5ExILEQ40RXA3DUHoEJ
 +PvwlulIjGeMh4OkzpSFeh6K+sJNwiz7XSwpH2K5IQPxwzeStDqTJdSd2C4XvCI+ch4LzcVgK
 qmlUPtqBhjiIEV5MW9QoH1MskQUCHctAMNH81W+xNDO0usOJkcQwuIhlKPm5rs/NATCucwJ
X-Mailman-Approved-At: Thu, 01 Oct 2020 06:11:08 +0000
Cc: Alexander Dahl <ada@thorsis.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Denis Osterland-Heim <denis.osterland@diehl.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [Linux-stm32] [PATCH v6 1/7] leds: pwm: Remove platform_data support
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

U2luY2UgY29tbWl0IDE0MWYxNWM2NmQ5NCAoImxlZHM6IHB3bTogcmVtb3ZlIGhlYWRlciIpIHRo
YXQgcGxhdGZvcm0KaW50ZXJmYWNlIGlzIG5vdCB1c2FibGUgZnJvbSBvdXRzaWRlIGFuZCB0aGVy
ZSBzZWVtcyB0byBiZSBubyBpbiB0cmVlCnVzZXIgYW55bW9yZS4gIEFsbCBpbi10cmVlIHVzZXJz
IG9mIHRoZSBsZWRzLXB3bSBkcml2ZXIgc2VlbSB0byB1c2UgRFQKY3VycmVudGx5LiAgR2V0dGlu
ZyByaWQgb2YgdGhlIG9sZCBwbGF0Zm9ybSBpbnRlcmZhY2UgYWxsb3dzIHRoZQpsZWRzLXB3bSBk
cml2ZXIgdG8gc3dpdGNoIG92ZXIgZnJvbSAnZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoKScg
dG8KJ2Rldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dCgpJy4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBEYWhsIDxwb3N0QGxlc3BvY2t5LmRlPgpDYzogRGVuaXMgT3N0ZXJsYW5kLUhlaW0g
PGRlbmlzLm9zdGVybGFuZEBkaWVobC5jb20+ClJldmlld2VkLWJ5OiBNYXJlayBCZWjDum4gPG1h
cmVrLmJlaHVuQG5pYy5jej4KLS0tCgpOb3RlczoKICAgIHY1IC0+IHY2OgogICAgICAqIGFkZGVk
IFJldmlld2VkLWJ5IGZyb20gTWFyZWsKICAgICAgKiBtaW5pbWFsIGNvbW1pdCBtZXNzYWdlIHJl
d29yZGluZywgYmVjYXVzZSBhIGxhdGVyIHBhdGNoIHdhcwogICAgICAgIGFscmVhZHkgYXBwbGll
ZAogICAgCiAgICB2NToKICAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAocmVwbGFj
aW5nIGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgIHdvcmtpbmcsIGRpZmZlcmVudCBh
cHByb2FjaCkKICAgIAogICAgdjU6CiAgICAgKiBhZGRlZCB0aGlzIHBhdGNoIHRvIHNlcmllcyAo
cmVwbGFjaW5nIGFub3RoZXIgcGF0Y2ggd2l0aCBhIG5vdAogICAgICAgd29ya2luZywgZGlmZmVy
ZW50IGFwcHJvYWNoKQoKIGRyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIHwgMzAgKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYyBiL2RyaXZl
cnMvbGVkcy9sZWRzLXB3bS5jCmluZGV4IDJhMTZhZTBiZjAyMi4uZjUzZjkzMDljYTZjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYworKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1w
d20uYwpAQCAtMjQsMTEgKzI0LDYgQEAgc3RydWN0IGxlZF9wd20gewogCXVuc2lnbmVkIGludAlt
YXhfYnJpZ2h0bmVzczsKIH07CiAKLXN0cnVjdCBsZWRfcHdtX3BsYXRmb3JtX2RhdGEgewotCWlu
dAkJbnVtX2xlZHM7Ci0Jc3RydWN0IGxlZF9wd20JKmxlZHM7Ci19OwotCiBzdHJ1Y3QgbGVkX3B3
bV9kYXRhIHsKIAlzdHJ1Y3QgbGVkX2NsYXNzZGV2CWNkZXY7CiAJc3RydWN0IHB3bV9kZXZpY2UJ
KnB3bTsKQEAgLTYwLDYgKzU1LDcgQEAgc3RhdGljIGludCBsZWRfcHdtX3NldChzdHJ1Y3QgbGVk
X2NsYXNzZGV2ICpsZWRfY2RldiwKIAlyZXR1cm4gcHdtX2FwcGx5X3N0YXRlKGxlZF9kYXQtPnB3
bSwgJmxlZF9kYXQtPnB3bXN0YXRlKTsKIH0KIAorX19hdHRyaWJ1dGVfXygobm9ubnVsbCkpCiBz
dGF0aWMgaW50IGxlZF9wd21fYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21f
cHJpdiAqcHJpdiwKIAkJICAgICAgIHN0cnVjdCBsZWRfcHdtICpsZWQsIHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGUpCiB7CkBAIC03MywxMCArNjksNyBAQCBzdGF0aWMgaW50IGxlZF9wd21f
YWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdiwKIAlsZWRf
ZGF0YS0+Y2Rldi5tYXhfYnJpZ2h0bmVzcyA9IGxlZC0+bWF4X2JyaWdodG5lc3M7CiAJbGVkX2Rh
dGEtPmNkZXYuZmxhZ3MgPSBMRURfQ09SRV9TVVNQRU5EUkVTVU1FOwogCi0JaWYgKGZ3bm9kZSkK
LQkJbGVkX2RhdGEtPnB3bSA9IGRldm1fZndub2RlX3B3bV9nZXQoZGV2LCBmd25vZGUsIE5VTEwp
OwotCWVsc2UKLQkJbGVkX2RhdGEtPnB3bSA9IGRldm1fcHdtX2dldChkZXYsIGxlZC0+bmFtZSk7
CisJbGVkX2RhdGEtPnB3bSA9IGRldm1fZndub2RlX3B3bV9nZXQoZGV2LCBmd25vZGUsIE5VTEwp
OwogCWlmIChJU19FUlIobGVkX2RhdGEtPnB3bSkpCiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgUFRSX0VSUihsZWRfZGF0YS0+cHdtKSwKIAkJCQkgICAgICJ1bmFibGUgdG8gcmVxdWVzdCBQ
V00gZm9yICVzXG4iLApAQCAtMTM5LDE1ICsxMzIsMTEgQEAgc3RhdGljIGludCBsZWRfcHdtX2Ny
ZWF0ZV9md25vZGUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbGVkX3B3bV9wcml2ICpwcml2
KQogCiBzdGF0aWMgaW50IGxlZF9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKLQlzdHJ1Y3QgbGVkX3B3bV9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9IGRldl9nZXRfcGxh
dGRhdGEoJnBkZXYtPmRldik7CiAJc3RydWN0IGxlZF9wd21fcHJpdiAqcHJpdjsKLQlpbnQgY291
bnQsIGk7CiAJaW50IHJldCA9IDA7CisJaW50IGNvdW50OwogCi0JaWYgKHBkYXRhKQotCQljb3Vu
dCA9IHBkYXRhLT5udW1fbGVkczsKLQllbHNlCi0JCWNvdW50ID0gZGV2aWNlX2dldF9jaGlsZF9u
b2RlX2NvdW50KCZwZGV2LT5kZXYpOworCWNvdW50ID0gZGV2aWNlX2dldF9jaGlsZF9ub2RlX2Nv
dW50KCZwZGV2LT5kZXYpOwogCiAJaWYgKCFjb3VudCkKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0x
NTcsMTYgKzE0Niw3IEBAIHN0YXRpYyBpbnQgbGVkX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCWlmICghcHJpdikKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlpZiAocGRh
dGEpIHsKLQkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKLQkJCXJldCA9IGxlZF9wd21f
YWRkKCZwZGV2LT5kZXYsIHByaXYsICZwZGF0YS0+bGVkc1tpXSwKLQkJCQkJICBOVUxMKTsKLQkJ
CWlmIChyZXQpCi0JCQkJYnJlYWs7Ci0JCX0KLQl9IGVsc2UgewotCQlyZXQgPSBsZWRfcHdtX2Ny
ZWF0ZV9md25vZGUoJnBkZXYtPmRldiwgcHJpdik7Ci0JfQorCXJldCA9IGxlZF9wd21fY3JlYXRl
X2Z3bm9kZSgmcGRldi0+ZGV2LCBwcml2KTsKIAogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
