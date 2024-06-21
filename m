Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC1911C22
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 08:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91012C7128E;
	Fri, 21 Jun 2024 06:54:44 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB9DBC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 06:54:36 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-57d1d45ba34so1775590a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718952876; x=1719557676;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eTkDcANmcuZleL0PmBZXzJ8dQlOYVbwGmUQGEpaTcvk=;
 b=H0sSvTsF/OAlwDJIHX2zDvSlhrSxqCRzAYSqmyirUgX4f6BTY+Q6YgTJXwqsBSyaCz
 2rDt08cy0aNX4Lkoyn6GMexNxExolFGgOGBUmMFs08aUfpcpT+cOWBMuqHBKu9Z5kr0C
 RK6OIkDnQf85aawhXTJRDz0n+EgMFecOR3/rtpvteZnxGxwk2We9JAeykzLPAHD660k5
 JFtZQikn7xZ809EM6CL08I8vl4KphaP1n+Zl+ccaFRDwMEq+b/Fc4mlx6aJNjS1ltG53
 pHuZop429xKUOK9durzMo9+gsd2+L+FH+RLX5Q72m3SXG+a1RotmNDHTSTmCIoKpEKSz
 FN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718952876; x=1719557676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eTkDcANmcuZleL0PmBZXzJ8dQlOYVbwGmUQGEpaTcvk=;
 b=fwmyrTFn23re68iQRuDADWnIYwJ4xvyEekZI/O8Pt1deHV/Bg3mih5PHRuTYTOVkOv
 i8rl6cLlJq50FRHvFALf/wXyus0CK2TRXXnCuAD2b8G+3/udAViCJWBB1UlzclmmygL9
 MSSAX829Ke3dmuaClnU7olEtlpXiDTgtnzor5QJjzrjAk7tTDcIIS9HwUvPXBLegigFp
 JmkSjnFTnc/ziAug9+z3DHxEDFTurX2CAfhQ0c1fRPYlHfe7F6DbeGucSedDfrebbQnK
 YOY/X/udcIOy/RSx6P9sK3Rwc4N2i7244ildROXq++V3cecwegHXmzkX7JQFQRTvpqBD
 Jj5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwsAB/THw8XIpsm1vm047PJ30dom7uAvFcTg+71en8y0ghH2My5/cEhxijYSbHSWM/YaY+YPDDJTDigjLkV9WucCAP2PWP0xka2FNBtPKhKvBDLv2PsBXi
X-Gm-Message-State: AOJu0YwgGGXESyax5jyygnou07A7xXCmDw8n8kSsIIWf7etOaB4t08N3
 qOYLwaJUS3ugVD2pK/YSiLXoBVxeRGG/3J4nPcssDDUpuJZiCYO6QWY40P1Q6q8=
X-Google-Smtp-Source: AGHT+IGLODE/V4p7R0sIIFSMmoxTGUJxgRGk7dfcAmBtIMl5OqgZ3hMha7NpDNa9+6zqYk6YZBDHJA==
X-Received: by 2002:a50:9e67:0:b0:57d:57c:ce99 with SMTP id
 4fb4d7f45d1cf-57d07e68e29mr3936219a12.2.1718952876161; 
 Thu, 20 Jun 2024 23:54:36 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d305351dbsm505883a12.77.2024.06.20.23.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 23:54:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 21 Jun 2024 08:54:17 +0200
Message-ID: <20240621065418.2760898-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=MXCWIEHjZagT0uCOJ+g+R76lwVk/kK6hKx6erlJbECU=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhrRS5VkZv/vvcYVeZVioJNofXpqyzyvx0aLf/HEbjYSFk
 4oFcyd1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRwmvsf8U/hJ0+0+pcp5Uy
 JyauT9m0xWb3D1+LVr7k3g3df/OzTvMZ3u70vb05oqni++uKclH3Ni32GrEdT2M1lJ5cfHCoQ+H
 SCu9LcZlNR+XmN9x2PL55l6rP+u+61hcexK9L0vSVmbDl97Pf8xY09b42nX58aqobY6qX0EXWnx
 uqarZsmLfBqrZP9vhmGcGTj9W2vchstLyy7uFPv+3sncVuCwT73gdPKW7hzzRi+y6769j/qXyWm
 iz9fzX75vX0zjyl+14+v+PpneVLOvY0vLvLyvYwrUfPQLxwlxKf7wFpjgnuLQ5R2y6n3uAM5ba3
 ldQt54lO6V/XmyDQ5bOu8lDxg90sX59O2pl+I8jfeEEiAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stm32: Fix error message to not describe
	the previous error path
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

IkZhaWxlZCB0byBsb2NrIHRoZSBjbG9jayIgaXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgbWVzc2Fn
ZSBmb3IKY2xrX3JhdGVfZXhjbHVzaXZlX2dldCgpIGZhaWxpbmcsIGJ1dCBub3QgZm9yIHRoZSBj
bG9jayBydW5uaW5nIHRvbwpmYXN0IGZvciB0aGUgZHJpdmVyJ3MgY2FsY3VsYXRpb25zLgoKQWRh
cHQgdGhlIGVycm9yIG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgpGaXhlczogZDQ0ZDYzNTYzNWE3ICgi
cHdtOiBzdG0zMjogRml4IGZvciBzZXR0aW5ncyB1c2luZyBwZXJpb2QgPiBVSU5UMzJfTUFYIikK
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJy
ZS5jb20+Ci0tLQpIZWxsbywKCkkganVzdCBmb3VuZCB0aGlzIGlzc3VlIHdoaWxlIHByZXBhcmlu
ZyBhIFBSIGluY2x1ZGluZyB0aGUgdHdvIHB3bS1zdG0zMgpmaXhlcyBhdmFpbGFibGUgYXQKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVyLjE3MTg3ODg4MjYuZ2l0LnUua2xlaW5lLWtv
ZW5pZ0BiYXlsaWJyZS5jb20vIC4KClRoaXMgcGF0Y2ggYmVpbmcgdHJpdmlhbCBhbmQgdXNlZnVs
IEknbGwgc2VuZCBpdCBhbG9uZyB3aXRoIHRoZSBvdGhlcgp0d28uIFNvIHdoZW4geW91IG5vdGlj
ZSB0aGlzIHBhdGNoIGl0J3MgcHJvYmFibHkgYWxyZWFkeSB0byBsYXRlIHRvIHNlbmQKYSByZXZp
ZXcgOi0pCgpkNDRkNjM1NjM1YTcgd2FzIG9ubHkgaW5jbHVkZWQgaW4gdjYuMTAtcmMxLCBzbyBu
byBzdGFibGUgdGFnIG5lY2Vzc2FyeS4KCkJlc3QgcmVnYXJkcwpVd2UKCiBkcml2ZXJzL3B3bS9w
d20tc3RtMzIuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJz
L3B3bS9wd20tc3RtMzIuYwppbmRleCBhMmYyMzFkMTNhOWYuLmNkNzI0NTE4MzM2MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMy
LmMKQEAgLTY3Myw3ICs2NzMsOCBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCSAqIC5hcHBseSgpIHdvbid0IG92ZXJmbG93LgogCSAq
LwogCWlmIChjbGtfZ2V0X3JhdGUocHJpdi0+Y2xrKSA+IDEwMDAwMDAwMDApCi0JCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwgIkZhaWxlZCB0byBsb2NrIGNsb2NrXG4iKTsKKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLCAiQ2xvY2sgZnJlcSB0b28gaGlnaCAo
JWx1KVxuIiwKKwkJCQkgICAgIGNsa19nZXRfcmF0ZShwcml2LT5jbGspKTsKIAogCWNoaXAtPm9w
cyA9ICZzdG0zMnB3bV9vcHM7CiAKCmJhc2UtY29tbWl0OiAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdm
YmQ5YmU3YTBiY2ZhY2ZhYmQwCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
