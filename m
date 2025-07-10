Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36AB0079B
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:51:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB78DC349C2;
	Thu, 10 Jul 2025 15:51:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66DC9C349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
 b=NoOG/5n3eNk1WDsqPLy/gTrXzR40kMOq9CpEFCSL8Dn1c1B2W2Y/hGvafTkgupA1jY0Xbi
 S6bMhfPxv0AJqjNxnL4XTEe27nbTRCxpofubbD/8KszqGmobFnHqDd3hutNKF9asSZJnP3
 +0ag61dv8pFI6o00kQfOP267IpLgKOs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-GAW7S2IcPPKs711nTT8vkg-1; Thu, 10 Jul 2025 11:51:43 -0400
X-MC-Unique: GAW7S2IcPPKs711nTT8vkg-1
X-Mimecast-MFC-AGG-ID: GAW7S2IcPPKs711nTT8vkg_1752162702
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6ff810877aaso26071356d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162702; x=1752767502;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WADJ7rxEf5+t43hyxNegpLJp1h0n13l+s0KkiLPhYtw=;
 b=tah0o2S5Ts8upP/uvvDMnhvMY4xhFPQ1V9LudNgwUV3K/Jugg2jei4dn/6H1ARGq6v
 ACDp5WGxY9sRCgfldDH05h6iZzFKKFVlsxRU0gnQgVdcLy3ziNCW4Msd3/APaQMvH3JE
 K7oRi/q+EI8/C80BEDF1loA+kyC37iDYjyjaC4kRrJOYsoe/tbNnSw/CCML2aaWoPWfU
 og3u/pZEXv+ACzRapMwmZp5ASMP4wNXYPJR6XcDNmUhYgSKWGXlOuL//xmkFscbSFXxt
 kPO3Daxztle1+inbxUOiJ8wgU4BOcndzZWKF3rN3xFQ2+UvTdzTVzufShqOWJw8JxCo9
 UGQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU39KaqWnNaLV9Jj29rDIG/PcT4C1Fuzk2c08XPIeXRCxJDkka8e51TVF4wfDjY1vrrNOFYlx4LIkiGYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxez5mgRax6yPNNaZ2YrT0gzmlo9Kd6+6NyMdJN7NsSVymxLw91
 c1aB1SHXGqqb96RTGT411T8bAIy03Np+mqGue88MweTlYMgp+C30DDQ5AWW0f9nBJSvuMkWQ5G3
 YvuAG0LaPA6x8Dj4gbrRV0+0OeLnoTI0qMa5F7vV8nA/AG5SOiOy3FBIIsutD0UeKlDQM5WuNrB
 QrKQoPwg==
X-Gm-Gg: ASbGncvKBd3QMXMqkhwvyjxWpRGcccqYMiIkCRHxbY6iXBvXa74Sw2xfeiUcdPFOueH
 5BXhZvoj5OQtX2M9FGUe+LO/3YWCnGUAmqjo3rZzuYy4oyIPd/tD4iH7Kq7edhaWjVvGLedhc7C
 FJbEu47CunfH0odAzWYnMIG1KcrCEftRJiPyldY80ZUL/r9TY7ef5LzwqOHlVPyVY/wSy4H7AjE
 HWwCKaF4lM/g7cZqDaIXup+xVye8dwBSwnFHiNFJkmU3bSDhDHbXPn3oT+hCYYXMd0/2I68G3L/
 YM5YYVrBp2BHj32kJ9DfXzthzDoB9GrpVs90tB1pakAUYK4gwQnnGrfCYQKQ
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id
 6a1803df08f44-704981df370mr48741536d6.32.1752162702185; 
 Thu, 10 Jul 2025 08:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6tTS21fRt7gW+5oC/mUmMYYDHl8pgKSfHGnscN6OnkB2uw7eNnpNtqA9BjpxUhpgOQUOErg==
X-Received: by 2002:a05:6214:f6f:b0:6fb:50da:48c0 with SMTP id
 6a1803df08f44-704981df370mr48740986d6.32.1752162701655; 
 Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:06 -0400
Message-Id: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrhb2gC/x2MQQqAIBAAvxJ7bkGDMvpKdDDdaiks1oog+nvib
 eYw80IkYYrQFS8I3Rx5D0l0WYBbbJgJ2SeHSlW1Mlph3K/g0W0rSiaxJ6H1o7ZGj75tDKT0EJr
 4ydt++L4fj0lNa2YAAAA=
X-Change-ID: 20250710-sound-clk-round-rate-adb1a71bd867
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=5203;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9HMFkZbuW9ZpnWbftnssfH9Bqhp8qt4XbuXWzr1wRy0=;
 b=sGBwjqYM4hPVL1CZFdLUsSLiPft7TSDB69HuiD4QNIFy9Mz6ke78nYWLUUl9QcWx2qrOP3kGY
 O85EabSwvs7AKgAZmdJB/ePYT6ukziJUFUbHtudOEOYr50RuwcvWs0Y
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pLC_hvVTPuUP_WCuxAj9cG9WYJTjfTB9oX3Bursxvmw_1752162702
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the rtc subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (6):
      sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()

 sound/soc/codecs/da7219.c                 | 64 ++++++++++++++++---------------
 sound/soc/codecs/rt5682.c                 | 26 +++++++------
 sound/soc/codecs/rt5682s.c                | 26 +++++++------
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c |  8 ++--
 sound/soc/stm/stm32_i2s.c                 | 21 ++++++----
 sound/soc/stm/stm32_sai_sub.c             | 14 ++++---
 6 files changed, 87 insertions(+), 72 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-sound-clk-round-rate-adb1a71bd867

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
