Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PKcGMfB4Gm8lgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 13:02:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD540D161
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 13:02:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74368C87ED3;
	Thu, 16 Apr 2026 11:02:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90903C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 11:02:28 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d7a5e77b1so342835f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776337348; x=1776942148;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iCyszGnOgLovfFmk29ajceFYb/ZXq9+n4I2vTeO5bXo=;
 b=wFH76N95+bNHwYidWNCUq9fpt4GaywmBbucjZVnH5q0jzviNp80U+HqpIXeQyERXPU
 UhaZuAvv4oQz69VaAe+oXpCEyvkkIiJKRfZY+S/QNNKfqH+s9UsAtP8ImtrxnFXG/5g/
 pP5cF+qvH17psoOVBjqpALXjPApESMMBlbfvph0ICKsdFbCqMVh794V6OtUCxIR88yUL
 Xjs/TXLRDAIqx4fsoRjBeNfxYeUDRURW9J8+lnGVDQCpQpzOaki039pzr4lm6FB1o3Wr
 Pe8n/rFj+mvyYHMgT19MGNSaGR0eZqb6eNDtmVG0tIMbhfZclH+cnHZV1Dct8PNDrMDo
 //2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776337348; x=1776942148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCyszGnOgLovfFmk29ajceFYb/ZXq9+n4I2vTeO5bXo=;
 b=C8XxnYP7RZQ0dai3ScByUVQy6+IAiLbELTo5pg+W7xJeZHGGjiqsXUPuBJNpWOP5hK
 vmHNZZ2V/+7uwvUwgjaDOt1EH3O22kNi3cWlJtw9mbgUHjXwV7MZPM70hkLSIZd6kr2+
 ofvzll4jxdAhs9KmhKweB0ndTxZevSMxneMVZE+4/BikwJlNewqSZ8AYX67TCu2i0Igu
 ZNnlMV1/oYuN7VekoqARIgQ5Hz4yVzcWgAbZzz2FjS4pFnxzD8pumZ3MFZHg/47Fr8SZ
 WwipvoWelVzHD/MtqWOk8MZeIUD7YIuvQb5MjWtW8luFQN+KD8v577lE59u0YXZjyJfq
 T+pw==
X-Gm-Message-State: AOJu0YzFl7Z71aXBgOhC0MTMnqS41hbmwYBfWPnLtH4VmNBfeYwVA1lv
 Boafef+N6/Ihrv8tuyAiwDxrEy0Sz5s9O0a2CNFcrtDtWlpcvYWPWSRoabs2VZw5Oek=
X-Gm-Gg: AeBDies43uNjgSqUDI+WYnJWIimaPLvcgpChZdEQFWekpTXxrjcx/UqXgqgsO7fiBy6
 mJG2oUWJw1JZdZqxgXdxfj8wV8eI/ANwoN02YvFPe0DwhasTRU8iYd9ym63Xcs7hNSqeYQpJsNl
 FRI9V2lw85UEaelQt7sxvEE6Z03Md8nmjYNMgR6FJZDO+n9ma5+FEknngzOhFv/2VQtC9ulFAil
 hYnUhlz1KWAFaWK23VLCnGkdOR0bafXwU9RhO9hP0ys9oI+4Rbg+WFACTLkR36dS0ewG3l71ZeT
 QPc2l9kgTEYbkvACbzppXL8lW8fukHMCFECXGN/xJZLuU+zjP3YqlkajChojwNKlSZ3n5qJApet
 OKOnUOjByvDGVyCoq8AsblmraWYD129O8xue+EdJbXM5TJmKMQNb1okeaRkmZknNHMOzdExzp6x
 wxKbnxSlwMKYoeZQ9avkjF0fcM4kxZM1EDKycUKzRGAP2QRcn4Sg/OFHcPldWmv1MspBRo4x9U7
 oxEaEc7v5w4x5k=
X-Received: by 2002:a05:6000:2387:b0:43d:6df0:c7f6 with SMTP id
 ffacd0b85a97d-43fdbb4d72dmr2310498f8f.18.1776337347513; 
 Thu, 16 Apr 2026 04:02:27 -0700 (PDT)
Received: from localhost
 (p200300f65f20eb0885e9dbcbb434af4b.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb08:85e9:dbcb:b434:af4b])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43ead3d5fe1sm12701781f8f.22.2026.04.16.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 04:02:26 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 16 Apr 2026 13:02:15 +0200
Message-ID: <20260416110218.594911-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4511;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=Y1BgV1iQXev91LhXSBciaXbwGuzgkgY/QMn9ijj0Aq8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4MG6v7vW37qghx48W4XPKNcHFnYxqN8elzAvb
 59/0A4715uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeDBugAKCRCPgPtYfRL+
 TmbQB/0b+geuL4tVRtm0P2sBmAHLvSobdJiJ/zcfY95vTRSq7mFMT+ow9wVyPKiSB9k2DLfBuQD
 CM48sJA8fpvo0CDHmE4x6G/1Ytg83R6T0RKiizrBu5RQML6cQudTKeZKGx9zATrIz94FQfGnq1f
 6OWkPNvOH9p46weHYip5yEkYOanUeIXJz5NEoNNRfb0E34XgBUXDgzu+jEVgdx2YmJ5Clu2BO5V
 Nj1T7TadK7DO8YNtX79Nv5f1QH1C7+ru7Tre4ffrdcbcudcKxo7hnIc1/6uNqMwkDCvIHC/olR+
 M4HcsSVeHueFVR9Yv47hsvK1Vsd/nO3uBheifWPgVEJTo6wF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add board pin documentation
	stm32mp135f-dk
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
X-Spamd-Result: default: False [8.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.769];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,baylibre.com:mid,baylibre.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,0.0.0.13:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D0CD540D161
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

UmVsYXRlIHRoZSBkZXZpY2VzIGRlZmluZWQgaW4gdGhlIGRldmljZSB0cmVlIHRvIHRoZSBTb0Mg
cG9ydHMgYW5kIHBpbnMKYW5kIGxhYmVscyBhdmFpbGFibGUgb24gdGhlIGJvYXJkLgoKU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+
Ci0tLQpIZWxsbywKCml0J3MgYWx3YXlzIHRoZSBzYW1lIHRoaW5ncyBJIGxvb2sgdXAgaW4gdGhl
IHZhcmlvdXMgZG9jdW1lbnRhdGlvbnMuIFB1dAp0aGlzIGluZm9ybWF0aW9uIGluIHRoZSBkdHMg
dG8gc2ltcGxpZnkgdGhpcyBpbiB0aGUgZnV0dXJlLgoKQmVzdCByZWdhcmRzClV3ZQoKIGFyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cyB8IDI4ICsrKysrKysrKysrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cwppbmRleCA0ZDRjZWM4Yjg2
YWMuLmQ3MGZjMGI1MzYyZCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJt
cDEzNWYtZGsuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0
cwpAQCAtNjQsNiArNjQsNyBAQCBncGlvLWtleXMgewogCQljb21wYXRpYmxlID0gImdwaW8ta2V5
cyI7CiAKIAkJYnV0dG9uLXVzZXIgeworCQkJLyogR1BJTyBvbiBQQTEzICJVc2VyIGJ1dHRvbiAy
IChCMikiICovCiAJCQlsYWJlbCA9ICJVc2VyLVBBMTMiOwogCQkJbGludXgsY29kZSA9IDxCVE5f
MT47CiAJCQlncGlvcyA9IDwmZ3Bpb2EgMTMgKEdQSU9fQUNUSVZFX0xPVyB8IEdQSU9fUFVMTF9V
UCk+OwpAQCAtNzQsNiArNzUsNyBAQCBsZWRzIHsKIAkJY29tcGF0aWJsZSA9ICJncGlvLWxlZHMi
OwogCiAJCWxlZF9ibHVlOiBsZWQtYmx1ZSB7CisJCQkvKiBHUElPIG9uIFBBMTQgIlVzZXIgTEVE
IChMRDMpIiAqLwogCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fSEVBUlRCRUFUOwogCQkJY29s
b3IgPSA8TEVEX0NPTE9SX0lEX0JMVUU+OwogCQkJZ3Bpb3MgPSA8JmdwaW9hIDE0IEdQSU9fQUNU
SVZFX0xPVz47CkBAIC04Miw2ICs4NCw3IEBAIGxlZF9ibHVlOiBsZWQtYmx1ZSB7CiAJCX07CiAK
IAkJbGVkLXJlZCB7CisJCQkvKiBHUElPIG9uIFBBMTMgIlVzZXIgTEVEIChMRDQpIiAqLwogCQkJ
ZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fU1RBVFVTOwogCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lE
X1JFRD47CiAJCQlncGlvcyA9IDwmZ3Bpb2EgMTMgR1BJT19BQ1RJVkVfTE9XPjsKQEAgLTI1Miw2
ICsyNTUsNyBAQCBwaHkwX2V0aDE6IGV0aGVybmV0LXBoeUAwIHsKIAogJmkyYzEgewogCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CisJLyogU0RBIG9uIFBFOCA9IENOOC4yNywg
U0NMIG9uIFBEMTIgPSBDTjguMjggKi8KIAlwaW5jdHJsLTAgPSA8JmkyYzFfcGluc19hPjsKIAlw
aW5jdHJsLTEgPSA8JmkyYzFfc2xlZXBfcGluc19hPjsKIAlpMmMtc2NsLXJpc2luZy10aW1lLW5z
ID0gPDk2PjsKQEAgLTQ4Niw3ICs0OTAsMTAgQEAgY291bnRlciB7CiAJCXN0YXR1cyA9ICJva2F5
IjsKIAl9OwogCXB3bSB7Ci0JCS8qIFBXTSBvdXRwdXQgb24gcGluIDcgb2YgdGhlIGV4cGFuc2lv
biBjb25uZWN0b3IgKENOOC43KSB1c2luZyBUSU0zX0NINCBmdW5jICovCisJCS8qCisJCSAqIENI
NCBvbiBQQjEgPSBDTjguNzsKKwkJICogY29uZmxpY3Rpbmcgd2l0aCAmdXNhcnQxIENIMyBvbiBQ
QjAgPSBDTjguMTAgaXMgcG9zc2libGUKKwkJICovCiAJCXBpbmN0cmwtMCA9IDwmcHdtM19waW5z
X2E+OwogCQlwaW5jdHJsLTEgPSA8JnB3bTNfc2xlZXBfcGluc19hPjsKIAkJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKQEAgLTUwNSw3ICs1MTIsMTAgQEAgY291bnRlciB7CiAJ
CXN0YXR1cyA9ICJva2F5IjsKIAl9OwogCXB3bSB7Ci0JCS8qIFBXTSBvdXRwdXQgb24gcGluIDMx
IG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChDTjguMzEpIHVzaW5nIFRJTTRfQ0gyIGZ1bmMg
Ki8KKwkJLyoKKwkJICogQ0gyIG9uIFBEMTMgPSBDTjguMzE7CisJCSAqIGNvbmZsaWN0aW5nIHdp
dGggJmkyYzEgQ0gxIG9uIFBEMTIgPSBDTjguMjggaXMgcG9zc2libGUKKwkJICovCiAJCXBpbmN0
cmwtMCA9IDwmcHdtNF9waW5zX2E+OwogCQlwaW5jdHJsLTEgPSA8JnB3bTRfc2xlZXBfcGluc19h
PjsKIAkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKQEAgLTUyNCw3ICs1MzQs
MTIgQEAgY291bnRlciB7CiAJCXN0YXR1cyA9ICJva2F5IjsKIAl9OwogCXB3bSB7Ci0JCS8qIFBX
TSBvdXRwdXQgb24gcGluIDMyIG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChDTjguMzIpIHVz
aW5nIFRJTThfQ0gzIGZ1bmMgKi8KKwkJLyoKKwkJICogQ0gzIG9uIFBFNSA9IENOOC4zMgorCQkg
KiBjb25mbGljdGluZyB3aXRoICZ1c2FydDEgQ0gxTiBvbiBQQTcgPSBDOC4zNiBpcyBwb3NzaWJs
ZQorCQkgKiBjb25mbGljdGluZyB3aXRoICZ1c2FydDEgQ0gyTiBvbiBQQjAgPSBDOC4xMCBpcyBw
b3NzaWJsZQorCQkgKiBjb25mbGljdGluZyB3aXRoICZ1c2FydDEgQ0gzTiBvbiBQQjEgPSBDOC43
IGlzIHBvc3NpYmxlCisJCSAqLwogCQlwaW5jdHJsLTAgPSA8JnB3bThfcGluc19hPjsKIAkJcGlu
Y3RybC0xID0gPCZwd204X3NsZWVwX3BpbnNfYT47CiAJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCIsICJzbGVlcCI7CkBAIC01NDEsNyArNTU2LDcgQEAgY291bnRlciB7CiAJCXN0YXR1cyA9ICJv
a2F5IjsKIAl9OwogCXB3bSB7Ci0JCS8qIFBXTSBvdXRwdXQgb24gcGluIDMzIG9mIHRoZSBleHBh
bnNpb24gY29ubmVjdG9yIChDTjguMzMpIHVzaW5nIFRJTTE0X0NIMSBmdW5jICovCisJCS8qIENI
MSBvbiBQRjkgPSBDSDguMzMgKGFsdGVybmF0aXZlbHkgb24gUEE3ID0gQ044LjM2IGNvbmZsaWN0
aW5nIHdpdGggJnVzYXJ0MSAqLwogCQlwaW5jdHJsLTAgPSA8JnB3bTE0X3BpbnNfYT47CiAJCXBp
bmN0cmwtMSA9IDwmcHdtMTRfc2xlZXBfcGluc19hPjsKIAkJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IiwgInNsZWVwIjsKQEAgLTU1Myw2ICs1NjgsNyBAQCB0aW1lckAxMyB7CiB9OwogCiAmdWFy
dDQgeworCS8qIEFjY2Vzc2libGUgdmlhIG1pY3JvIFVTQiBTVC1MSU5LIFVTQiAoQ04xMCkgKi8K
IAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiLCAiaWRsZSI7CiAJcGluY3RybC0w
ID0gPCZ1YXJ0NF9waW5zX2E+OwogCXBpbmN0cmwtMSA9IDwmdWFydDRfc2xlZXBfcGluc19hPjsK
QEAgLTU2NCw2ICs1ODAsNyBAQCAmdWFydDQgewogCiAmdWFydDggewogCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCIsICJzbGVlcCIsICJpZGxlIjsKKwkvKiBUWCBvbiBQRTEgPSBDTjguMzcsIFJY
IG9uIFBGOSA9IENOOC4zMyAqLwogCXBpbmN0cmwtMCA9IDwmdWFydDhfcGluc19hPjsKIAlwaW5j
dHJsLTEgPSA8JnVhcnQ4X3NsZWVwX3BpbnNfYT47CiAJcGluY3RybC0yID0gPCZ1YXJ0OF9pZGxl
X3BpbnNfYT47CkBAIC01NzQsNiArNTkxLDcgQEAgJnVhcnQ4IHsKIAogJnVzYXJ0MSB7CiAJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIiwgImlkbGUiOworCS8qIFRYIG9uIFBDMCA9
IENOOC44LCBSWCBvbiBQQjAgPSBDTjguMTAsIFJUUyBvbiBQQzIgPSBDTjguMTEsIENUUyBvbiBQ
QTcgPSBDTjguMzYgKi8KIAlwaW5jdHJsLTAgPSA8JnVzYXJ0MV9waW5zX2E+OwogCXBpbmN0cmwt
MSA9IDwmdXNhcnQxX3NsZWVwX3BpbnNfYT47CiAJcGluY3RybC0yID0gPCZ1c2FydDFfaWRsZV9w
aW5zX2E+OwpAQCAtNTg0LDYgKzYwMiw3IEBAICZ1c2FydDEgewogLyogQmx1ZXRvb3RoICovCiAm
dXNhcnQyIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiLCAiaWRsZSI7CisJ
LyogVFggb24gUEgxMiwgUlggb24gUEQxNSwgUlRTIG9uIFBENCwgQ1RTIG9uIFBFMTEgKi8KIAlw
aW5jdHJsLTAgPSA8JnVzYXJ0Ml9waW5zX2E+OwogCXBpbmN0cmwtMSA9IDwmdXNhcnQyX3NsZWVw
X3BpbnNfYT47CiAJcGluY3RybC0yID0gPCZ1c2FydDJfaWRsZV9waW5zX2E+OwpAQCAtNjEzLDYg
KzYzMiw3IEBAIGh1YkAxIHsKIH07CiAKICZ1c2JvdGdfaHMgeworCS8qIFVTQiBUeXBlLUMgRFJQ
IChDTjcpICovCiAJcGh5cyA9IDwmdXNicGh5Y19wb3J0MSAwPjsKIAlwaHktbmFtZXMgPSAidXNi
Mi1waHkiOwogCXVzYi1yb2xlLXN3aXRjaDsKCmJhc2UtY29tbWl0OiA5MzZjMjEwNjhkN2FkZTAw
MzI1ZTQwZDgyYmZkMmYzZjI5ZDlmNjU5Ci0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
