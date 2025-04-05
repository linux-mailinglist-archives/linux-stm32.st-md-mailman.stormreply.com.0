Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC8A7C881
	for <lists+linux-stm32@lfdr.de>; Sat,  5 Apr 2025 11:27:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF4EC78F89;
	Sat,  5 Apr 2025 09:27:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E1EC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  5 Apr 2025 09:27:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5eb5ecf3217so4810849a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 05 Apr 2025 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845256; x=1744450056;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
 b=nRWyT1/h9Qg8CLJnn6D1osDShhEvJa07KMZTZ3vgJKBUorUON2TjkARr7k19L58Gqo
 qhRvzhMlvzJOfi0bqOinskxnWHFkaEeLGVOzQZiXt3hb7jC+6RgUwy/5bwjeXn+SFWr8
 7LCnrw8vnA2qU9WiCpOiz4LpY2Iu9DzhKOWk+qbibukLuro2ubtq0evfiAPqIUo0v4p6
 IjJIiYs51KoXlvR9LSs6udJ86p2dEkqrVKRFi7cCDZGE+WJOVDdOwxMQ6+2Fnnpg1Mb5
 uecuIzgxbEoJdwqWhMDWorfnPVJDELVuyrPrvEnDmrqJXtCkcAHcw8NoqM8griNYdqzD
 izoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743845256; x=1744450056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
 b=A37L1i0gNSTI15RVTmyEmyLpt15sYNK6mrClEQdJla571DCRMJG2JWovFMPukiy2Bz
 bfbsaRc3NQ+ulcfXt62UBoEinVk01bD12wfFPz/mKKt4Wkmsv/xT3TLYowPoa+PF9PgP
 jrHdddmciVGEaouTZRpCaVMjjKGxW+/h7vqS1wl/mMSIoT87fz9kMmFhi/RU4FFqogNg
 l4RFt7X/x6e+BYaQa5q5k//kSVeIPL2KbVv4oP7qrHQvbGsmT+2trsB0idj0lBxHo/NK
 WSjhCLS6PwyHsCrlqYi1RCsrViuw8E8w7Hkt+Nnaro8Lp1R5849YMbLWwVh/8O97j/tR
 zrpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl6d6PoxkDkQ35BHogEUWwgZDgOjKAP4AxMIbJx++/68D1LT6VCROSl3CVV+Ljh1DQxUA4+avylRTd/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywn8SYrky7zQ4aOU4us7K226zdtmYJTXGebOMSuk4urRhY4EEQx
 JNTwM6QsfU65sWiIgGDwPWssNJ0K785dayFMg4ePtc6j/NHfNy5QCMYm+qeZ+QA=
X-Gm-Gg: ASbGncu39Q8U4qjsuJQ8mSBZMad6UTFer9hesrnpncuRQl5i1bnFB5NNHhfpryklsnF
 d4unzVoCcuQkouvC8v2svwFPBbOItAEFr8k6W8qDxm97CIqV1Ap3M8I4XufJP7+REzgVXGa0oUv
 xI3XNt/XBU2WbJUp9I+kQu4NYFc6cTHMFKBXLg7liz/IuV+s1F/f2XQLZhZgUgqVfkUH0JcX/wD
 JKWw0w+Mw1UL4berFCVU6rLg/VpIwItkiQDJ0i10bp8/ZfudfPhhRCRF08EfzbKv3viHeKpgLqN
 FHM9wxha+wGS9Fmaye1Rw8kJRiZaM+AfL0OUBS3g9p1PM7xB2g==
X-Google-Smtp-Source: AGHT+IEbL8c+JGzPbn45puOitVnDeaHIThpApjBbi0QC6iao2fwFoA3sj7pZiaJmhvJQOzAGSNO8Mg==
X-Received: by 2002:a05:6402:280b:b0:5e6:44d9:57f7 with SMTP id
 4fb4d7f45d1cf-5f0b3e4732amr4711403a12.26.1743845255834; 
 Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f087ed1f40sm3442815a12.26.2025.04.05.02.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Sat,  5 Apr 2025 11:27:11 +0200
Message-ID: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=SdTjxolhxMdpEMLdv2bok/HJQZH5YHyXLZcK4xTHZec=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhvQP3wue3FO2D7yoPyX3tFXWCtPSC9wxXg/6hGTMVGZbB
 hUsSOLvZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAid05wMHQGvZ3cUu4YtHTp
 6coW45J/V5ef4p8hFa0cvPZHwTankIZ5zcd8X3KV8W84vpJ5YuP6zPN+y88nLy7l0rM9cTnLuLL
 G9WP4rv+Zdsb3XjxQMVAW9f434WduiGpiv0aE95O5T7uZZdvK018/ruj1KZ8/V5DXo1la9VhDeo
 WpifGV+IOPl7c+yAsWdTY8WLbKvITd6Gy/u5Yi644lPVpzN8zxZt5i+P/zp7dX91xz9WTX1bK+p
 cu+IOJaaHvGkjkhBT0V6rM6e5jK8kSW7S57pxZz4oXsBE8nxqu1joLhd8+JX1m41p9XW9U+ba9B
 0fzGfZ32j64rr7YwizpmKp1fVFSz83yM3/11HQna2zcAAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] pwm: Some fixes preparing chardev support
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

SGVsbG8sCgp3aGlsZSB3b3JraW5nIG9uIGNoYXJhY3RlciBkZXZpY2Ugc3VwcG9ydCBmb3IgUFdN
cyBJIGZvdW5kIGEgZmV3CmluY29uc2lzdGVuY2llcyB0aGF0IGFyZSBmaXhlZCBpbiB0aGlzIHNl
cmllcy4gQWZ0ZXIgdGhhdCBJIHBsYW4gdG8gd29yawpvbiBnZXR0aW5nIHRoZSBjaGFyYWN0ZXIg
ZGV2aWNlIHN1cHBvcnQgaW50byBzaGFwZSB0byBnZXQgaXQgaW50bwptYWlubGluZSwgdG9vLgoK
V2hpbGUgc29tZSBvZiB0aGVzZSBwYXRjaGVzIHF1YWxpZnkgYXMgZml4ZXMgSSB0aGluayB0aGVy
ZSBpcyBubyB1cmdlIHRvCmdldCB0aGVtIGludG8gNi4xNSwgYnV0IGdpdmVuIHRoZXJlIGlzIGEg
YnVuY2ggb2Ygc3VjaCBjaGFuZ2VzIEkgbWlnaHQKc2VuZCB0aGVtIHRvIGFsbCB0b2dldGhlciB0
byBMaW51cyBmb3IgaW5jbHVzaW9uIHRvIDYuMTUuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xl
aW5lLUvDtm5pZyAoNik6CiAgcHdtOiBMZXQgcHdtX3NldF93YXZlZm9ybSgpIHN1Y2NlZWQgZXZl
biBpZiBsb3dsZXZlbCBkcml2ZXIgcm91bmRlZCB1cAogIHB3bTogc3RtMzI6IFNlYXJjaCBhbiBh
cHByb3ByaWF0ZSBkdXR5X2N5Y2xlIGlmIHBlcmlvZCBjYW5ub3QgYmUKICAgIG1vZGlmaWVkCiAg
cHdtOiBzdG0zMjogRG9uJ3Qgb3Blbi1jb2RlIFRJTV9DQ0VSX0NDeEUoKQogIHB3bTogc3RtMzI6
IEVtaXQgZGVidWcgb3V0cHV0IGFsc28gZm9yIGNvcm5lciBjYXNlcyBvZiB0aGUgcm91bmRpbmcK
ICAgIGNhbGxiYWNrcwogIHB3bTogYXhpLXB3bWdlbjogTGV0IC5yb3VuZF93YXZlZm9ybV90b2h3
KCkgc2lnbmFsIHdoZW4gcmVxdWVzdCB3YXMKICAgIHJvdW5kZWQgdXAKICBwd206IERvIHN0cmlj
dGVyIHJldHVybiB2YWx1ZSBjaGVja2luZyBmb3IgLnJvdW5kX3dhdmVmb3JtX3RvaHcoKQoKIGRy
aXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgfCAyMyArKysrKysrKysrKystLS0tLS0tLS0tLQog
ZHJpdmVycy9wd20vcHdtLWF4aS1wd21nZW4uYyB8IDEwICsrKysrKystLS0KIGRyaXZlcnMvcHdt
L3B3bS1zdG0zMi5jICAgICAgfCAyNSArKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6
IGU0OGU5OWI2ZWRmNDFjNjljNTUyOGFhN2ZmYjJkYWYzYzU5ZWUxMDUKLS0gCjIuNDcuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
