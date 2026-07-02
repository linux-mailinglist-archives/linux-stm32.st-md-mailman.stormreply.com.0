Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CZv1DIp7RmqWXAsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 16:54:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03186F9180
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 16:54:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=ZC2tAVs3;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 652CFC8F272;
	Thu,  2 Jul 2026 14:54:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C6B3C7A834
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 14:54:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493c83474ddso4424105e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1783004040; x=1783608840;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
 b=ZC2tAVs3gClAvttMuuD1RxvTZroIjDaxyesRQaRyfZHC3CDMZ0T2PcyzN0KqSaNfaZ
 v2XxMKrmwC1sElSAbz3yOpMWvyt+1qqtbLw7GiQD3qS7xVKhvOYiQXdwC8pTxYwrJWz0
 9To+qhbaQv41pNC/8IOPloyToPqU850tu3N0ByOfMSX0nJ/zJm0TsmfQ7ATpSJ0T35ec
 BOmnJq9/hwi5SPZm0AGo4rWU575GFXmUMB3tudK+Ibc469MUES2rLobUEBzldSnANtcv
 BsklV74Xslxov6q+Xjy2gpFmEuGapR4Uzo5fEf9nYPd86HURyu0e6wNdb3iBFlzLUlxE
 yfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783004040; x=1783608840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
 b=nRrgWXSuBOw0XvaxGRKKFKKeZkmIp2dF3j/kWmcjj20ukfckkrYua/UFLnM3V8c7R6
 nH2+aB9YU7/aBp+lbCSQPnjCbN/si09b+IxhNj/KiWmy3etJW5USAorScW/QlZK+VtAS
 uOkx/u0GrGVcB56xhufoMBCCy0S76BSunoasMfFcFE6FzZ8h1kw4n0i2RHYN+SgwLZy6
 3GOSViKwwQVTIBpQyq3y3LhEiPjUAwy6R93uf1DFUgUTraIeQAs5JTCMYoNtZ3FdFLXz
 lO6kSMiM/LvSwuTO0QFEHM+d+VDEM08RkIEQ50H87xKQm0Z1MFakamMz7tsAqnF359Pb
 X39w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HlImL/IA+SOR/GCnQ93Qbwjv3l6FjQTNZJTf/Hs3h1soV9IeDJzLaGTu2YeFNDWAvYkNhJq7cmRKwUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQ9QmhJEXmvuZMyz0jZ/YK6S29TKh9DC1S1Nh9/It3wSPuVBaF
 03AhA8DgxFtUk8JWa8OoC3/jlU8YbkWWxkNeOliPdUdsXVa+RD1oZUuv1XdMUc42EIM=
X-Gm-Gg: AfdE7cmbovWfpgMaN3jOCLIRZsMjeuaYeknkg9Nu1fsZOkvpVQ3mpb4fI7PQ991Q40I
 n8JiR8QfWaV05duFxAIraLEslx/vjdKbUdFPY+3Agt+OOzRCebeV6X8At9nekVq3AmWiQ9Q7JZZ
 WSivlhUQCLfJh4mvWnr+5GnoMtCqgI2bZLeDmgZDvDtQaiYqnyjBauodPh+o/lraOZmnpUo2EMF
 lrpu/CwXEpYfkJtn1c1qkknvCldx23kwtD4byynqqYBUY8lwCMCFiPtVlfukCAqKcUnFJ40WRLk
 Y0Q3ik0KWG/NkaLqSkvR52pZUc/7vf+73wpDmIilagjIdW/ThUPY/Bo3NNdLq8ITFfPhni+c9+v
 0hbeeNL6xqVf2PJfRlKHgzFePXEsEXae/IdMBQyKATeyGYk3J6mxLuQ20Ny6PviLRPnSPJnmVqi
 rEkK6VjX+8fS5x6w0IPd1q0Gav9oDgY21tgReMgZ6Kyrofa2HPPl5do4GkpNMXLuWB0lQN3H7QI
 KSs
X-Received: by 2002:a05:600c:705:b0:493:b962:4abe with SMTP id
 5b1f17b1804b1-493c3dfacf0mr54863745e9.36.1783004039655; 
 Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
Received: from localhost
 (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-493c63b6f1bsm49814885e9.10.2026.07.02.07.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Date: Thu,  2 Jul 2026 16:53:38 +0200
Message-ID: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=xnvnSkh4mR8ONwsduDg/BLAZXZr6/CxgasUbEs0w6+o=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqRnty/yxLuXfqpkyn+N9SjKdq6zQf5RlY3lz4I
 55PYGK74jGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakZ7cgAKCRCPgPtYfRL+
 Tn6eCACqswh1Rk+hVIVYEKELUVvKdCmO7XKTWIrWdpQ/WlV0lqQ0YKOrgltvPWKMEUm2uG3Cyru
 clzgwExexTgigLBkspq263IUPvp7cK/ScLoq3veeoxtVpG3wNHil3Mwz5LKuwxjf+uVKmVokmnl
 Hnxb1CC4HTHZyPnpdwJBdO7PmNj+4GlSvJ52KUcs2f7WbrUY/u0MgbYFl0bYJCXwUnVyj4OVldu
 gDLZlTzgj/sCimLCa9vG+nNQvuERsiPBJ/fiwcApIv2M/M/cB3BLpz/oMjZJOaLK5aJaCWGNvjE
 CunjE3evQ4iBKLGvR+9mGYHc8IiSiTg1cvNAiBYIHqJ15gWZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Colin Foster <colin.foster@in-advantage.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 Orson Zhai <orsonzhai@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 0/3] mfd: Initialize spi_device_id arrays
	using member names
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:jogletre@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:zhang.lyra@gmail.com,m:trix@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:colin.foster@in-advantage.com,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:mcoquelin.stm32@gmail.com,m:patches@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:orsonzhai@gmail.com,m:yilun.xu@intel.com,m:linux-arm-kernel@lists.infradead.org,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,diasemi.com,gmail.com,redhat.com,st-md-mailman.stormreply.com,vger.kernel.org,in-advantage.com,linux.alibaba.com,cirrus.com,intel.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B03186F9180

SGVsbG8sCgp0aGlzIHNlcmllcyB0YXJnZXRzIHRvIHVzZSBuYW1lZCBpbml0aWFsaXplcnMgZm9y
IHNwaV9kZXZpY2VfaWQgYXJyYXlzLgpJbiBnZW5lcmFsIHRoZXNlIGFyZSBiZXR0ZXIgcmVhZGFi
bGUgZm9yIGh1bWFucyBhbmQgbW9yZSByb2J1c3QgdG8KY2hhbmdlcyBpbiB0aGUgcmVzcGVjdGl2
ZSBzdHJ1Y3QgZGVmaW5pdGlvbi4KClRoaXMgcm9idXN0bmVzcyBpcyBuZWVkZWQgYXMgSSB3YW50
IHRvIGRvCgoJZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZGV2aWNlLWlkL3NwaS5oIGIvaW5j
bHVkZS9saW51eC9kZXZpY2UtaWQvc3BpLmgKCWluZGV4IDgxMmU3YzM4NTRhNy4uOTNkOWNkNDU1
NjlhIDEwMDY0NAoJLS0tIGEvaW5jbHVkZS9saW51eC9kZXZpY2UtaWQvc3BpLmgKCSsrKyBiL2lu
Y2x1ZGUvbGludXgvZGV2aWNlLWlkL3NwaS5oCglAQCAtMTMsNyArMTMsMTEgQEAgdHlwZWRlZiB1
bnNpZ25lZCBsb25nIGtlcm5lbF91bG9uZ190OwoJIAoJIHN0cnVjdCBzcGlfZGV2aWNlX2lkIHsK
CQljaGFyIG5hbWVbU1BJX05BTUVfU0laRV07CgktCWtlcm5lbF91bG9uZ190IGRyaXZlcl9kYXRh
OwkvKiBEYXRhIHByaXZhdGUgdG8gdGhlIGRyaXZlciAqLwoJKwl1bmlvbiB7CgkrCQkvKiBEYXRh
IHByaXZhdGUgdG8gdGhlIGRyaXZlciAqLwoJKwkJa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGE7
CgkrCQljb25zdCB2b2lkICpkcml2ZXJfZGF0YV9wdHI7CgkrCX07CgkgfTsKCSAKCSAjZW5kaWYg
LyogaWZuZGVmIExJTlVYX01PRF9ERVZJQ0VfSURfU1BJX0ggKi8KCndoaWNoIGFsbG93cyBkcm9w
cGluZyBzZXZlcmFsIGNhc3RzIGFuZCBlYXNlcyBwb3J0aW5nIENIRVJJIHRvIG1haW5saW5lCkxp
bnV4LiBBIHBvc3NpYmxlIGZvbGxvdy11cCBjaGFuZ2UgaXMgdGhlIGZvbGxvd2luZyBleGFtcGxl
OgoKCWRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9pbnRlbC1tMTAtYm1jLXNwaS5jIGIvZHJpdmVy
cy9tZmQvaW50ZWwtbTEwLWJtYy1zcGkuYwoJaW5kZXggOTRiOWM5OWJiNGY4Li4yOGEzY2M4NGI3
NzggMTAwNjQ0CgktLS0gYS9kcml2ZXJzL21mZC9pbnRlbC1tMTAtYm1jLXNwaS5jCgkrKysgYi9k
cml2ZXJzL21mZC9pbnRlbC1tMTAtYm1jLXNwaS5jCglAQCAtNzAsNyArNzAsNyBAQCBzdGF0aWMg
aW50IGludGVsX20xMF9ibWNfc3BpX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCgkJaWYg
KCFkZGF0YSkKCQkJcmV0dXJuIC1FTk9NRU07CgkgCgktCWluZm8gPSAoc3RydWN0IGludGVsX20x
MGJtY19wbGF0Zm9ybV9pbmZvICopaWQtPmRyaXZlcl9kYXRhOwoJKwlpbmZvID0gaWQtPmRyaXZl
cl9kYXRhX3B0cjsKCQlkZGF0YS0+ZGV2ID0gZGV2OwoJIAoJCWRkYXRhLT5yZWdtYXAgPSBkZXZt
X3JlZ21hcF9pbml0X3NwaV9hdm1tKHNwaSwgJmludGVsX20xMGJtY19yZWdtYXBfY29uZmlnKTsK
CUBAIC0xNjAsOSArMTYwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9tMTBibWNfcGxh
dGZvcm1faW5mbyBtMTBibWNfc3BpX241MDEwID0gewoJIH07CgkgCgkgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfZGV2aWNlX2lkIG0xMGJtY19zcGlfaWRbXSA9IHsKCS0JeyAubmFtZSA9ICJtMTAt
bjMwMDAiLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJm0xMGJtY19zcGlfbjMwMDAg
fSwKCS0JeyAubmFtZSA9ICJtMTAtZDUwMDUiLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpJm0xMGJtY19zcGlfZDUwMDUgfSwKCS0JeyAubmFtZSA9ICJtMTAtbjUwMTAiLCAuZHJpdmVy
X2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJm0xMGJtY19zcGlfbjUwMTAgfSwKCSsJeyAubmFtZSA9
ICJtMTAtbjMwMDAiLCAuZHJpdmVyX2RhdGFfcHRyID0gJm0xMGJtY19zcGlfbjMwMDAgfSwKCSsJ
eyAubmFtZSA9ICJtMTAtZDUwMDUiLCAuZHJpdmVyX2RhdGFfcHRyID0gJm0xMGJtY19zcGlfZDUw
MDUgfSwKCSsJeyAubmFtZSA9ICJtMTAtbjUwMTAiLCAuZHJpdmVyX2RhdGFfcHRyID0gJm0xMGJt
Y19zcGlfbjUwMTAgfSwKCQl7IH0KCSB9OwoJIE1PRFVMRV9ERVZJQ0VfVEFCTEUoc3BpLCBtMTBi
bWNfc3BpX2lkKTsKCmluY3JlYXNpbmcgcmVhZGFiaWxpdHkgZHVlIHRvIGxlc3MgZXhwbGljaXQg
Y2FzdGluZy4gVGhpcyBhbHNvIHlpZWxkcwp0aWdodGVyIHR5cGUgY2hlY2tpbmcgYXMgdGhlIGFz
c2lnbm1lbnQgaW4gdGhlIGZpcnN0IGh1bmsgcmVzdWx0cyBpbiBhCndhcm5pbmcgaWYgaW5mbyB3
YXNuJ3QgYSBwb2ludGVyIHRvIGEgY29uc3QgdHlwZS4KCklmIHlvdSBjb25zaWRlciB0aGUgbGFz
dCBwYXRjaCBtb3N0bHkgY2h1cm4sIGp1c3QgZHJvcCBpdC4KClRoZXJlIGFyZSBubyBkZXBlbmRl
bmNpZXMgYmV0d2VlbiB0aGUgcGF0Y2hlcywgYW5kIHRoZXkgYXJlIG1lcmdlIHdpbmRvdwptYXRl
cmlhbC4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBI
dWIpICgzKToKICBtZmQ6IERyb3AgdW51c2VkIGFzc2lnbm1lbnQgb2Ygc3BpX2RldmljZV9pZCBk
cml2ZXIgZGF0YQogIG1mZDogSW5pdGlhbGl6ZSBzcGlfZGV2aWNlX2lkIGFycmF5cyB1c2luZyBt
ZW1iZXIgbmFtZXMKICBtZmQ6IFVuaWZ5IHN0eWxlIG9mIHNwaV9kZXZpY2VfaWQgYXJyYXlzCgog
ZHJpdmVycy9tZmQvYWx0ZXJhLWExMHNyLmMgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9hcml6
b25hLXNwaS5jICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiBkcml2ZXJzL21mZC9jczQwbDUwLXNw
aS5jICAgICAgIHwgIDQgKystLQogZHJpdmVycy9tZmQvZGE5MDUyLXNwaS5jICAgICAgICB8IDEy
ICsrKysrKy0tLS0tLQogZHJpdmVycy9tZmQvaW50ZWwtbTEwLWJtYy1zcGkuYyB8ICA2ICsrKy0t
LQogZHJpdmVycy9tZmQvbWFkZXJhLXNwaS5jICAgICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0t
LQogZHJpdmVycy9tZmQvbW90b3JvbGEtY3BjYXAuYyAgICB8ICA2ICsrKy0tLQogZHJpdmVycy9t
ZmQvb2NlbG90LXNwaS5jICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC9yazh4eC1zcGkuYyAg
ICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbWZkL3JzbXVfc3BpLmMgICAgICAgICAgfCAxMiArKysr
KystLS0tLS0KIGRyaXZlcnMvbWZkL3NwcmQtc2MyN3h4LXNwaS5jICAgfCAgMiArLQogZHJpdmVy
cy9tZmQvc3RtcGUtc3BpLmMgICAgICAgICB8IDEyICsrKysrKy0tLS0tLQogZHJpdmVycy9tZmQv
dHBzNjU5MTItc3BpLmMgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC93bTgzMXgtc3BpLmMgICAg
ICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogMTQgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9u
cygrKSwgNTQgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDRmNDQxOTYwZTY5MWQzN2M4ODBk
MmNjMDA0ZGUwNmJiNWI2YmQ1ZTQKLS0gCjIuNTUuMC4xMS5nMTUzNjY2YTdkOWJiCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
