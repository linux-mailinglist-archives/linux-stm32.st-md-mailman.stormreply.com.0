Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B70A7C885
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Apr 2025 11:27:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF9A2C78F89;
	Sat,  5 Apr 2025 09:27:44 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA3FCC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Apr 2025 09:27:43 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so469624866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Apr 2025 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845263; x=1744450063;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
 b=XR1KnvqWLIp8qZ0OJaD8JX827h4/0/ZapSPy45z58VBiBg+FWhaRQJBYZUQ6XOHP9w
 cbTRfSJ86l/BSK9zlUraJNOY+dVhumtJCrg1Acl+k4G//4/DTmq7+bcOXEG5P+NgVapb
 HSkrifCFuO5NBoWLMYXOTy5YG78jnd/iQ0QBBETQymvd+AXtZYuOD5ThFh17s4yYuLrA
 LBB+A+qfxMjBDTpWcGR6qVS34B6+P/FfQkmvWob2qeZo5RE5b6h3AhvepuF4viKl6kp8
 OS5/397+CGsdmIEHW5KJ73wISRvOfJSF13MlF9Cf3o3auF4BmMVz9LIN0jiwFUqAjNje
 zo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743845263; x=1744450063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZnZ1QBH4c/cR2r7Z2I0IWQDQQpPtp/xF22TjNG8zFs=;
 b=O3QvGD/QOCWRRQfm9AZcInjGzRG71n7DIHTfYQOePkRDOKIYi58ryG58jwUkOYRGoT
 IsmM7LnvjVmoQ61kOXCA/DTYaKJ726AYZkdxgHazmF3g9MD4t5k/vLcYAayJ0II5KZjL
 4bBgaGsbYvx7WCS8uzWdGuZp4swLh5WhbcJ17xsmQSxbNs5h7an/1gpI09uaejPGj/+Z
 yMs4b7Brq9N1b1cJ2denItm/YLvtlxvaOEG6mhYWuNRxuyEQEGIWXIgt1u5zyXl27awb
 0Iy8M6JrUdSSCfeAT64cvZrIHhqSEY+o1l/VziBrVwEINMrCPs5saIpAjJ0g43NYUfMd
 q95g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoUVUH7K0qE1w+h/0z8sS4EWY0BYsOWjjTok0Wx8d9OCwKz47Wamd/VGjA2FRlGrg/NA9twce9Zc5xsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhOPpE6e89dX80MxOO3DR/wgjuEyWgunE7IX62zzAJ1Orv0qjs
 XpRMbOcP0QKCCaiqNh11dOoCqNncxSCFiGDmpRSb3aUuw4Ab/CsJm0ZU2eeoRDc=
X-Gm-Gg: ASbGncs4jxL2tFsSo/+roPNlvLdnfm9pO2WDVh+OGCKyq6+P8blOUGo2Tq9fAQf3Nk0
 JmAuqdWUyIqmYsNGNW8JFNjmObO9M94iPHcBKDRzPgdc5hlwLFq3PA/SyK9MnZAzd2bJxvP6oH7
 hBhGwyiznYg4Qb3Rk1h44iERPVVgq7DLjCowWB3eVu0ZtjXZvGh2YepUE9apF4HcYShVAw78QVO
 pGf5gvs6r98sa72GGxJ0Ja2KmviUyk1CLW/GiH4OYsvFfqPlcJEB0MkN19c68jilJzaV4grlMzb
 VWie+U0/NysQs6qAydy4s94c8R7SoaBohflGJ0350YQaqcHdJg==
X-Google-Smtp-Source: AGHT+IGWO7dBoEwfH+vhvetzVchvOebwHG0LSEkTGJ+mVXy0B0Ix45di+z7EJEIkw1x3jHja6bWBjg==
X-Received: by 2002:a17:907:7f07:b0:ac3:8a3a:e924 with SMTP id
 a640c23a62f3a-ac7d19903fdmr555132166b.39.1743845263101; 
 Sat, 05 Apr 2025 02:27:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac7bfea0eadsm394579766b.67.2025.04.05.02.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 02:27:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Sat,  5 Apr 2025 11:27:15 +0200
Message-ID: <fe154e79319da5ff4159cdc71201a9d3b395e491.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=PeMUN5MaPR/iihGuaAYk1+RqNZDBvhqS1HijQAO+fo4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd6gBS/U7sm8gCc++Qe+H9FPvkAFOyatKX8B
 qZYNTVb/8WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3egAKCRCPgPtYfRL+
 TiyKB/0dJZmWMtAaRs0WJ3PXT9d3VqFRF+ApoExKeBVC+2ES9YhZvF7McGhAzK48ik7Ly+LbIdd
 Il/cB2eBN8HrWNjZoHv/RVydoIwXGPyxm+7EVsFLjp6QVEbKfRjnonbncS3QTgmSKMIUL6e6JSC
 Exlph+FquJCDEjgnQZiyDNnKFMpId9mwZfG4STy0nFW4ohy/2CIVisdMr+VJ/Ku9COUq3a/FB+F
 QNpy10ntJAQfeJnxjycByIlnMBpPR+ouavHhm3lAae1baYZOSbounM633kPFBC43UuT9ehZ8ryi
 RmE7IGRwAQ/z49wXa8pqeOAbyygY5+bxUJ0PuQwUNrsaJoRK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] pwm: stm32: Emit debug output also for
	corner cases of the rounding callbacks
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

V2hlbiB5b3UncmUgaW50ZXJlc3RlZCBpbiB0aGUgYWN0dWFsIHJlZ2lzdGVyIHNldHRpbmdzIHRo
ZSBkcml2ZXIKY2hvb3NlcyBvciBpbnRlcnByZXRzIHlvdSB3YW50IHRvIHNlZSB0aGVtIGFsc28g
Zm9yIGNhbGxzIHRoYXQgaGl0CmNvcm5lciBjYXNlcy4KCk1ha2Ugc3VyZSB0aGF0IGFsbCBjYWxs
cyB0byBzdG0zMl9wd21fcm91bmRfd2F2ZWZvcm1fdG9odygpIGFuZApzdG0zMl9wd21fcm91bmRf
d2F2ZWZvcm1fZnJvbWh3KCkgZW1pdCB0aGUgZGVidWcgbWVzc2FnZSBhYm91dCB0aGUKcmVnaXN0
ZXIgc2V0dGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDExICsr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMKaW5kZXggYzY2MjVmNTFhMTk5Li5kY2E1ZDA5ZDgwYjkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC0x
ODAsMTEgKzE4MCwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9yb3VuZF93YXZlZm9ybV90b2h3
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKIAogCXdmaHctPmNjciA9IG1pbl90KHU2NCwgY2NyLCB3
Zmh3LT5hcnIgKyAxKTsKIAorb3V0OgogCWRldl9kYmcoJmNoaXAtPmRldiwgInB3bSMldTogJWxs
ZC8lbGxkIFsrJWxsZF0gQCVsdSAtPiBDQ0VSOiAlMDh4LCBQU0M6ICUwOHgsIEFSUjogJTA4eCwg
Q0NSOiAlMDh4XG4iLAogCQlwd20tPmh3cHdtLCB3Zi0+ZHV0eV9sZW5ndGhfbnMsIHdmLT5wZXJp
b2RfbGVuZ3RoX25zLCB3Zi0+ZHV0eV9vZmZzZXRfbnMsCiAJCXJhdGUsIHdmaHctPmNjZXIsIHdm
aHctPnBzYywgd2Zody0+YXJyLCB3Zmh3LT5jY3IpOwogCi1vdXQ6CiAJY2xrX2Rpc2FibGUocHJp
di0+Y2xrKTsKIAogCXJldHVybiByZXQ7CkBAIC0yMzYsMTcgKzIzNiwxNiBAQCBzdGF0aWMgaW50
IHN0bTMyX3B3bV9yb3VuZF93YXZlZm9ybV9mcm9taHcoc3RydWN0IHB3bV9jaGlwICpjaGlwLAog
CQkJd2YtPmR1dHlfbGVuZ3RoX25zID0gY2NyX25zOwogCQkJd2YtPmR1dHlfb2Zmc2V0X25zID0g
MDsKIAkJfQotCi0JCWRldl9kYmcoJmNoaXAtPmRldiwgInB3bSMldTogQ0NFUjogJTA4eCwgUFND
OiAlMDh4LCBBUlI6ICUwOHgsIENDUjogJTA4eCBAJWx1IC0+ICVsbGQvJWxsZCBbKyVsbGRdXG4i
LAotCQkJcHdtLT5od3B3bSwgd2Zody0+Y2Nlciwgd2Zody0+cHNjLCB3Zmh3LT5hcnIsIHdmaHct
PmNjciwgcmF0ZSwKLQkJCXdmLT5kdXR5X2xlbmd0aF9ucywgd2YtPnBlcmlvZF9sZW5ndGhfbnMs
IHdmLT5kdXR5X29mZnNldF9ucyk7Ci0KIAl9IGVsc2UgewogCQkqd2YgPSAoc3RydWN0IHB3bV93
YXZlZm9ybSl7CiAJCQkucGVyaW9kX2xlbmd0aF9ucyA9IDAsCiAJCX07CiAJfQogCisJZGV2X2Ri
ZygmY2hpcC0+ZGV2LCAicHdtIyV1OiBDQ0VSOiAlMDh4LCBQU0M6ICUwOHgsIEFSUjogJTA4eCwg
Q0NSOiAlMDh4IEAlbHUgLT4gJWxsZC8lbGxkIFsrJWxsZF1cbiIsCisJCXB3bS0+aHdwd20sIHdm
aHctPmNjZXIsIHdmaHctPnBzYywgd2Zody0+YXJyLCB3Zmh3LT5jY3IsIHJhdGUsCisJCXdmLT5k
dXR5X2xlbmd0aF9ucywgd2YtPnBlcmlvZF9sZW5ndGhfbnMsIHdmLT5kdXR5X29mZnNldF9ucyk7
CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
