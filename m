Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAixErul32miXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521D405852
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0213C3F944;
	Wed, 15 Apr 2026 14:50:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F45C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 14:50:33 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so84110035e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264633; x=1776869433;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dN1czsyDMNwwt/ST8KAAFfEC2IVqy3l0935RmxW/E4s=;
 b=edhf3czg93kKoxBqJi48FOfCcoUfH02u3t2f3CEAh1W42HuPPhjlQHZLZQC8kTr+yl
 Qt5GV1jrZPE4gGuYgpdbdcaXZlXL39XAgUtQuNcyuKvFLX5N/PLYjyyzKWoemvqpmwxG
 gaO3Qvyod1mbbRtSix7A2r27oxO0eiQX/m1OT2XTpSHeCFpU16P1aaKScPweDo4oYWb6
 1zOUVeJgR/Y4YGZT0g5Dfm8IE9+P9+qbpKeemG6ayV4frnrRVvsTmCKdiRsEgMPO5O/8
 /cb797TQyNmnie3lwjYrgse6E5MPNwBlrFWhDRxB11isu2ENVd7FHzTwjShhTvTaGGFB
 UjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776264633; x=1776869433;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dN1czsyDMNwwt/ST8KAAFfEC2IVqy3l0935RmxW/E4s=;
 b=O9Jhhyl2PY3gaH9Vy4SpCS3ULux6ITePez6y2jBnKjx7xdtTYV4vRecxp3vdD/iNsl
 8NfwjQcuFmDDbuFQjHLtj2wmuT9/Hpi6rjuuxEpSKtYWIV51katX+8rzH6BRjRhg7M9O
 eLBWKWs2bF7cT9JDw0ahF0kYw+GYaY11987rdSejtv38zZ4GeNmrYAjtqViJuzEeVdqk
 bXIw2Mn3d5hYjQF8ejEa9chVVlfsCR5tlHYV2iTMK19LE1b9IozblnNr/jBzFC0aiQpy
 t8hlaby97eBfZvmNBzW/ZcS+aIxtXBJtKSNesZNynHw054f6WZa2gFSGhKxmaUodYGdF
 rwSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8S8SYckuEbUtpvYNAjF94StKig9glysMadcy1EnVr1FWYeKQZ7GecvM0Lu8qVe7JXi1F7FoIN64lvew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzSwyvS11voUbRl2c/FX5cPwAQjv+OEqb2Mv5v4Ji8mE/k7bzK
 LKb/5gW6HUp/8Vwjzbxz3Tj5IDQl+LTePoA9ovCgEyjsPXvVLL5mLaKBbSm5jVr89h81k1c5n+U
 IXfmO
X-Gm-Gg: AeBDietx4Y1JzCxBiOf7cnnbTDFk8VmcPX6TNbgPdGdw3fYF8rYOVBVNjvK8STmQGKh
 GTIJWGVV/2FNPx5Bfi5eidmHZhZtcMnMpeZuFzSr7auhRc9Symtw2654mROYJXDSOi4bH0aQ6zH
 y3qtZa6LSnl8o6vGU9Fw/hZQcsjT0q7nFiducbfVchd4SgMI1xkQFWW99Wcs5Qbue6Wur3wf4XM
 QH8JKGqlZThNJ4MezuuQk47eQ/2z2P233QFNsXA2VAbJZfIVH+AQUQU/BUiirnWUofryxjwqyXC
 9soTh3NuKVW6AAY7ly2mUstSf3KDC7nNZfp5i9JjIGUIKCImgibGoGXm9RPy6D0PbnPklS9EmMo
 9gDOel+SjO9M1z+EvkpVkH2x5E/q4uigQvPkAkp2a/8nHlzHyokOfabUijO9ymek+Mj7QMofNio
 MiAA6fg54D2w2vpt16y7nZ9g6Y6T/MvBSVSokaQVBEbDDCG5XkwZlOyoolf7Ju1Qj3wTaJZLStK
 /UyMNOQvZEezes=
X-Received: by 2002:a05:6000:2884:b0:43d:7147:f51 with SMTP id
 ffacd0b85a97d-43d71471152mr23644870f8f.26.1776264632805; 
 Wed, 15 Apr 2026 07:50:32 -0700 (PDT)
Received: from localhost
 (p200300f65f20eb084c777289617ec110.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb08:4c77:7289:617e:c110])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43ead33d6e9sm6002565f8f.1.2026.04.15.07.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 07:50:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Apr 2026 16:50:13 +0200
Message-ID: <788319f0fff963feca4df3c5fcdd471dcf70ccdf.1776264104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
References: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=9qJeHZRbSFduELxueyX7SDFPcOQZv0zK9BdhVLKRq8s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp36Wq+0h8W3DUxZQpoIufXzY1woEyJ2vEcI6Ty
 gE7fVgqv/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCad+lqgAKCRCPgPtYfRL+
 TvXYCACHODrtzojzM+GDH+KQoXVs9juGlZQxs8Z09ps0/buJOG5/BuNanRDVteKwiGuD1lPSqw/
 EDTDA7D8CPKFNhCisbvPeHB/EFl1IWJkLsD6M8dXvVdLMNzBhN1lNQtdBbxVI3800i4L5FQEx0n
 HwxnQG082WB04KVIjZ1vTW5Tg/nowjwM10bxYnIW3UOEY0kxAij8/84WzxQ/Nf7VgT4UVuYZnKJ
 /hKuqIua8QIlJmM21WZpG43NSwSQ3rUUSCSvVLBxfVculBsw9zy3STZ2YPJpBL3krO/H3L9DE2G
 FWHIDoN33CFxASh65+tEq68zFKRcnvVpPDM/LBt+F7qFQz3T
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v1 2/2] pwm: stm32: Make use of
	mul_u64_u64_div_u64_roundup()
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-pwm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 3521D405852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

V2hlbiB0aGUgZHJpdmVyIHdhcyBjb252ZXJ0ZWQgdG8gdGhlIHdhdmVmb3JtIEFQSSB0aGUgbmVl
ZCBmb3IgdGhpcwpmdW5jdGlvbiBhcmlzZWQgYnV0IGF0IHRoYXQgdGltZSB0aGlzIGZ1bmN0aW9u
IGRpZG4ndCBleGlzdCB5ZXQuIEluIHRoZQptZWFudGltZSBpdCdzIGF2YWlsYWJsZSwgc28gc3dp
dGNoIHRvIHRoZSBnbG9iYWwgZnVuY3Rpb24gYW5kIGRyb3AgdGhlCmRyaXZlciBzcGVjaWZpYyBp
bXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMjcg
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIu
YyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDkzNTI1N2E4OTBiMC4uYzcwOGU0YTdh
ZDcwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3
bS9wd20tc3RtMzIuYwpAQCAtMTkzLDIyICsxOTMsNiBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9y
b3VuZF93YXZlZm9ybV90b2h3KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKIAlyZXR1cm4gcmV0Owog
fQogCi0vKgotICogVGhpcyBzaG91bGQgYmUgbW92ZWQgdG8gbGliL21hdGgvZGl2NjQuYy4gQ3Vy
cmVudGx5IHRoZXJlIGFyZSBzb21lIGNoYW5nZXMKLSAqIHBlbmRpbmcgdG8gbXVsX3U2NF91NjRf
ZGl2X3U2NC4gVXdlIHdpbGwgY2FyZSBmb3IgdGhhdCB3aGVuIHRoZSBkdXN0IHNldHRsZXMuCi0g
Ki8KLXN0YXRpYyB1NjQgc3RtMzJfcHdtX211bF91NjRfdTY0X2Rpdl91NjRfcm91bmR1cCh1NjQg
YSwgdTY0IGIsIHU2NCBjKQotewotCXU2NCByZXMgPSBtdWxfdTY0X3U2NF9kaXZfdTY0KGEsIGIs
IGMpOwotCS8qIFRob3NlIG11bHRpcGxpY2F0aW9ucyBtaWdodCBvdmVyZmxvdyBidXQgaXQgZG9l
c24ndCBtYXR0ZXIgKi8KLQl1NjQgcmVtID0gYSAqIGIgLSBjICogcmVzOwotCi0JaWYgKHJlbSkK
LQkJcmVzICs9IDE7Ci0KLQlyZXR1cm4gcmVzOwotfQotCiBzdGF0aWMgaW50IHN0bTMyX3B3bV9y
b3VuZF93YXZlZm9ybV9mcm9taHcoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCQkJCQkgICBzdHJ1
Y3QgcHdtX2RldmljZSAqcHdtLAogCQkJCQkgICBjb25zdCB2b2lkICpfd2ZodywKQEAgLTIyMywx
NiArMjA3LDE1IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3JvdW5kX3dhdmVmb3JtX2Zyb21odyhz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCiAJCXU2NCBjY3JfbnM7CiAKIAkJLyogVGhlIHJlc3VsdCBk
b2Vzbid0IG92ZXJmbG93IGZvciByYXRlID49IDE1MjU5ICovCi0JCXdmLT5wZXJpb2RfbGVuZ3Ro
X25zID0gc3RtMzJfcHdtX211bF91NjRfdTY0X2Rpdl91NjRfcm91bmR1cCgoKHU2NCl3Zmh3LT5w
c2MgKyAxKSAqICh3Zmh3LT5hcnIgKyAxKSwKLQkJCQkJCQkJCSAgICAgTlNFQ19QRVJfU0VDLCBy
YXRlKTsKKwkJd2YtPnBlcmlvZF9sZW5ndGhfbnMgPSBtdWxfdTY0X3U2NF9kaXZfdTY0X3JvdW5k
dXAoKCh1NjQpd2Zody0+cHNjICsgMSkgKiAod2Zody0+YXJyICsgMSksCisJCQkJCQkJCSAgIE5T
RUNfUEVSX1NFQywgcmF0ZSk7CiAKLQkJY2NyX25zID0gc3RtMzJfcHdtX211bF91NjRfdTY0X2Rp
dl91NjRfcm91bmR1cCgoKHU2NCl3Zmh3LT5wc2MgKyAxKSAqIHdmaHctPmNjciwKLQkJCQkJCQkg
ICAgICAgTlNFQ19QRVJfU0VDLCByYXRlKTsKKwkJY2NyX25zID0gbXVsX3U2NF91NjRfZGl2X3U2
NF9yb3VuZHVwKCgodTY0KXdmaHctPnBzYyArIDEpICogd2Zody0+Y2NyLCBOU0VDX1BFUl9TRUMs
IHJhdGUpOwogCiAJCWlmICh3Zmh3LT5jY2VyICYgVElNX0NDRVJfQ0N4UChjaCArIDEpKSB7CiAJ
CQl3Zi0+ZHV0eV9sZW5ndGhfbnMgPQotCQkJCXN0bTMyX3B3bV9tdWxfdTY0X3U2NF9kaXZfdTY0
X3JvdW5kdXAoKCh1NjQpd2Zody0+cHNjICsgMSkgKiAod2Zody0+YXJyICsgMSAtIHdmaHctPmNj
ciksCi0JCQkJCQkJCSAgICAgIE5TRUNfUEVSX1NFQywgcmF0ZSk7CisJCQkJbXVsX3U2NF91NjRf
ZGl2X3U2NF9yb3VuZHVwKCgodTY0KXdmaHctPnBzYyArIDEpICogKHdmaHctPmFyciArIDEgLSB3
Zmh3LT5jY3IpLAorCQkJCQkJCSAgICBOU0VDX1BFUl9TRUMsIHJhdGUpOwogCiAJCQl3Zi0+ZHV0
eV9vZmZzZXRfbnMgPSBjY3JfbnM7CiAJCX0gZWxzZSB7Ci0tIAoyLjQ3LjMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
