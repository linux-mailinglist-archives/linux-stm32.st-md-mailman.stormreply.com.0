Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 673457A91B4
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 08:23:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 252CAC6C82B;
	Thu, 21 Sep 2023 06:23:22 +0000 (UTC)
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF695C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 04:54:01 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-d814634fe4bso800388276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Sep 2023 21:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695272040; x=1695876840;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KBlJtLtsdI3hK0QdaI1JvF2kBovJQMFIeF0KITJB/xY=;
 b=jI9Q7Sa25H/yLjd9ZN+yXETNAjMMjk/R17fhkomAz72yvzJQbVpszhRlBoYPCcOo56
 yszE8nPbPfJ7Jiy7QqKTQvoxMj2ym5CJ+bVFjX+z6kgAHas0afuZdUIH+JSLzZuGEM3o
 2tSr9qXW7/6IYKTfVFTJgUBeVc2AcoVXEpiVSrtxDAvf23yZBBh+4ul/V7SU4yJBJYRu
 tFZxfQK5r859dHW5RFwj4o9YcXpCSKvRIer39AoczIJmyCLMFGYqqjQoQULH4vVlYs6Z
 hHfbpv1lru0kUN1TqvbaloRcZ6MIV4dWwhmt+R3BrrFvyIH1Pxmzg+VKwKcDu1osI2cy
 HeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695272040; x=1695876840;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KBlJtLtsdI3hK0QdaI1JvF2kBovJQMFIeF0KITJB/xY=;
 b=K3/TsqXDQIfWrMFVr0/N6xfUiiPvcw0lHuwEARAxq7UYlY9L6kjZvA/bkcyA0LwITm
 Wz7Uu7PyZhEBo9rjIEDzYmEfKiFPHOksLC7YvzyoWKa1C8yDarzMsMP5CgOs5nIptEtc
 wEChwISC41jK1aMeyN1kZ3jYHM8r3PWqH0ipRu0w874BPq12vq9HRDmepsYbu6mQEcCQ
 OfCzQRdZxHjz4bthdMytzW1HIj5eOuon96xI4fjGfDmGzvvTeqE+fIet+bLljvwriZuA
 Blan7zGTHdi+myZyxo781XHmfKBjdBx3MqVWKmWxAVHEnH+G3aj3qY6M6T3Ly1uRV8eM
 fdwA==
X-Gm-Message-State: AOJu0YzB+6kW88dsPkJ875OvWJU4dD8rC0aSaRFRVRxniCctRPVWSnxE
 XXjd0JqIgDXhR/xMaMUOS++BHNOe46vxJGMC5w==
X-Google-Smtp-Source: AGHT+IHI098EEpqO6htZ6MTc85xWWh3YpKsnqENPUYf7F/xvLGI92lITJbHV0USw1ADPIZbp1s0JkljinpuKkIaDuQ==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:4082:0:b0:d80:1391:1f1 with SMTP
 id n124-20020a254082000000b00d80139101f1mr63208yba.1.1695272040719; Wed, 20
 Sep 2023 21:54:00 -0700 (PDT)
Date: Thu, 21 Sep 2023 04:54:00 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGfMC2UC/x2NSwqEMBAFryK9tsEkw4BeRVzk05nphVG6RRTx7
 gZ3VbV47wIlYVIYmguEdlZeShXTNhD/vvwIOVUH21nX9dagblLiemIS3kkUmRf0KdY+O/tSRBN
 y777+k3MIUJdWoczH+zJO9/0A10IdAXUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695272040; l=2097;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=wxLohCJ8OZyT4ckFvNL/ySlACAagL4RRycYgRdRDcQE=;
 b=FJozEDATUZfUMAdvAUx5oyW6ZiVUThemIA/jnMSx8yNUj5AxeA4RjStYDSxol7J7+D4rXF5CQ
 KDXN5IlUqusC1qJ5YHBdUIOWRiGU0IIeYHvhB5gxVpdkMBQYmxwb0L3
X-Mailer: b4 0.12.3
Message-ID: <20230921-strncpy-drivers-iio-adc-stm32-adc-c-v1-1-c50eca098597@google.com>
From: Justin Stitt <justinstitt@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailman-Approved-At: Thu, 21 Sep 2023 06:23:20 +0000
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-adc: replace deprecated
	strncpy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

`strncpy` is deprecated for use on NUL-terminated destination strings [1].

We should prefer more robust and less ambiguous string interfaces.

We expect adc->chan_name[val] to be NUL-terminated based on ch_name's
use within functions that expect NUL-terminated strings like strncmp and
printf-likes:
| 	if (!strncmp(stm32_adc_ic[i].name, ch_name, STM32_ADC_CH_SZ)) {
| 		/* Check internal channel availability */
| 		switch (i) {
| 		case STM32_ADC_INT_CH_VDDCORE:
| 			if (!adc->cfg->regs->or_vddcore.reg)
| 				dev_warn(&indio_dev->dev,
| 					 "%s channel not available\n", ch_name);
...

There is no evidence that NUL-padding is needed either.

Considering the above, a suitable replacement is `strscpy` [2] due to
the fact that it guarantees NUL-termination on the destination buffer
without unnecessarily NUL-padding. If, for any reason, NUL-padding _is_
required we should go for `strscpy_pad`.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested
---
 drivers/iio/adc/stm32-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index f7613efb870d..9cdcf396d901 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2209,7 +2209,7 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 				ret = -EINVAL;
 				goto err;
 			}
-			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
+			strscpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
 			ret = stm32_adc_populate_int_ch(indio_dev, name, val);
 			if (ret == -ENOENT)
 				continue;

---
base-commit: 2cf0f715623872823a72e451243bbf555d10d032
change-id: 20230921-strncpy-drivers-iio-adc-stm32-adc-c-1bf936a4ffbb

Best regards,
--
Justin Stitt <justinstitt@google.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
