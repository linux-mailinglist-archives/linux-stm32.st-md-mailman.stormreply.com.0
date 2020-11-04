Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A52A6E01
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 20:36:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0186BC36B36;
	Wed,  4 Nov 2020 19:36:43 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A430C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 19:36:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c16so3419736wmd.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Nov 2020 11:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fgb1IEzfMnPc6nqs8QP0jEqoyFf5EkN3W0LREp5eok=;
 b=dUki5RoAgEUXeV68RfVBsjZNTcSI5/Puy7ll183zFMy88MFmsFDu++Lc+6nX6nS1AC
 f6R+u9/0cYkz9bE0iRfGya8+/e0t/t2FEmXyplh3cPVhWClmNbJpgnBPsGpWvSuWsKlb
 9Yjo3MWCHUzlFjclnW2Ag4ZTN/eP2MEPGJsQzi/Rmk6b89US8uJYtsMHbpNTdNur/rAP
 +xugpeZt1Bzs2DaMfrknk/bKiy6as07x7eJzKM9o7RHXNN6rROFE0jYf/ylkFx6iPDa4
 v2Sk+Vi/vHzMQHT2B8Xe+lbVvu8fbvl5bBn2n8yakmZw6QAO8IY8177O8vpbx9rtvWtk
 SEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fgb1IEzfMnPc6nqs8QP0jEqoyFf5EkN3W0LREp5eok=;
 b=UD5yuX6txc6eBjw4jg561BU6QzQm2Dpn3GMTfh9P3tvzqo+gQqwRSOByEBOHbuQICJ
 eFWqIWZCmMBrB6nNedDMd/QqTF+/GV0Pit0Xz0NQCDnsgJovGy9nY12QKUxGvuOjYtIH
 SVqmJ7+r/jsV4+rbL4G7GXiDbLC0UZr7pmkrER8YQwSIEAcFImGyNwF3wdN5nSSsFa37
 FxvNYlmbFpGVMB/mU1Spv+ARxWq886vU6gv0UAkjEb+yniQdsHTPMm1TF/fvzRWTIF1o
 b8SdJUtG/NzNgXTyu9ltssnJeaUekwrd452JeFS+t+5jciOc+HZq47uOPyfPIz9lEfVz
 6h3Q==
X-Gm-Message-State: AOAM531pdBGaqK5sE9j0C9UmiFm67s/SInkVXXZmb7fDtQp0viNgHejl
 g8tqdKfRU0pJD54Om/M0OdiFmQ==
X-Google-Smtp-Source: ABdhPJzZSKL8589f8RPwDs7HELd7TAx5FicWl/OW2kST8shLGYY49ni5v34zHDMZovFwCv5U+2lCfA==
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr6192642wmd.60.1604518600809; 
 Wed, 04 Nov 2020 11:36:40 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 11:36:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  4 Nov 2020 19:35:41 +0000
Message-Id: <20201104193549.4026187-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-serial@vger.kernel.org, Gerald Baeza <gerald.baeza@st.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 28/36] tty: serial: stm32-usart: Remove set
	but unused 'cookie' variables
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmM6IEluIGZ1bmN0aW9uIOKAmHN0bTMyX3RyYW5zbWl0
X2NoYXJzX2RtYeKAmToKIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jOjM1MzoxNTog
d2FybmluZzogdmFyaWFibGUg4oCYY29va2ll4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYzogSW4g
ZnVuY3Rpb24g4oCYc3RtMzJfb2ZfZG1hX3J4X3Byb2Jl4oCZOgogZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmM6MTA5MDoxNTogd2FybmluZzogdmFyaWFibGUg4oCYY29va2ll4oCZIHNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogR3JlZyBLcm9h
aC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEppcmkgU2xhYnkgPGpp
cmlzbGFieUBrZXJuZWwub3JnPgpDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tPgpDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+
CkNjOiBHZXJhbGQgQmFlemEgPGdlcmFsZC5iYWV6YUBzdC5jb20+CkNjOiBsaW51eC1zZXJpYWxA
dmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2Fy
dC5jCmluZGV4IGVlNmM3NzYyZDM1NTkuLmY0ZGUzMmQzZjJhZmUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0z
Mi11c2FydC5jCkBAIC0zNTAsNyArMzUwLDYgQEAgc3RhdGljIHZvaWQgc3RtMzJfdHJhbnNtaXRf
Y2hhcnNfZG1hKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAJc3RydWN0IHN0bTMyX3VzYXJ0X29m
ZnNldHMgKm9mcyA9ICZzdG0zMnBvcnQtPmluZm8tPm9mczsKIAlzdHJ1Y3QgY2lyY19idWYgKnht
aXQgPSAmcG9ydC0+c3RhdGUtPnhtaXQ7CiAJc3RydWN0IGRtYV9hc3luY190eF9kZXNjcmlwdG9y
ICpkZXNjID0gTlVMTDsKLQlkbWFfY29va2llX3QgY29va2llOwogCXVuc2lnbmVkIGludCBjb3Vu
dCwgaTsKIAogCWlmIChzdG0zMnBvcnQtPnR4X2RtYV9idXN5KQpAQCAtMzk0LDcgKzM5Myw3IEBA
IHN0YXRpYyB2b2lkIHN0bTMyX3RyYW5zbWl0X2NoYXJzX2RtYShzdHJ1Y3QgdWFydF9wb3J0ICpw
b3J0KQogCWRlc2MtPmNhbGxiYWNrX3BhcmFtID0gcG9ydDsKIAogCS8qIFB1c2ggY3VycmVudCBE
TUEgVFggdHJhbnNhY3Rpb24gaW4gdGhlIHBlbmRpbmcgcXVldWUgKi8KLQljb29raWUgPSBkbWFl
bmdpbmVfc3VibWl0KGRlc2MpOworCWRtYWVuZ2luZV9zdWJtaXQoZGVzYyk7CiAKIAkvKiBJc3N1
ZSBwZW5kaW5nIERNQSBUWCByZXF1ZXN0cyAqLwogCWRtYV9hc3luY19pc3N1ZV9wZW5kaW5nKHN0
bTMycG9ydC0+dHhfY2gpOwpAQCAtMTA4Nyw3ICsxMDg2LDYgQEAgc3RhdGljIGludCBzdG0zMl9v
Zl9kbWFfcnhfcHJvYmUoc3RydWN0IHN0bTMyX3BvcnQgKnN0bTMycG9ydCwKIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBkbWFfc2xhdmVfY29uZmlnIGNvbmZpZzsK
IAlzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IgKmRlc2MgPSBOVUxMOwotCWRtYV9jb29r
aWVfdCBjb29raWU7CiAJaW50IHJldDsKIAogCS8qIFJlcXVlc3QgRE1BIFJYIGNoYW5uZWwgKi8K
QEAgLTExMzIsNyArMTEzMCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfb2ZfZG1hX3J4X3Byb2JlKHN0
cnVjdCBzdG0zMl9wb3J0ICpzdG0zMnBvcnQsCiAJZGVzYy0+Y2FsbGJhY2tfcGFyYW0gPSBOVUxM
OwogCiAJLyogUHVzaCBjdXJyZW50IERNQSB0cmFuc2FjdGlvbiBpbiB0aGUgcGVuZGluZyBxdWV1
ZSAqLwotCWNvb2tpZSA9IGRtYWVuZ2luZV9zdWJtaXQoZGVzYyk7CisJZG1hZW5naW5lX3N1Ym1p
dChkZXNjKTsKIAogCS8qIElzc3VlIHBlbmRpbmcgRE1BIHJlcXVlc3RzICovCiAJZG1hX2FzeW5j
X2lzc3VlX3BlbmRpbmcoc3RtMzJwb3J0LT5yeF9jaCk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
