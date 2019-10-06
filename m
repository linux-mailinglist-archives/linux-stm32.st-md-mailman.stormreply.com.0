Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A379CD34D
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 18:03:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 014F3C36B0B;
	Sun,  6 Oct 2019 16:03:32 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5388CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 16:03:30 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id z125so3845560ybc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Oct 2019 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVq3A/TrWA22YphYYB+8No5n6QtHAxN2b6l0mk2+kwE=;
 b=El+CWmCQb7R1fo1oaYIeiyEHx3GBZV4IoBkFhd03r6gfzUl03znZ2gdd9tCnotz27U
 qf720XYBzApe7w5zHR9EQ6v6qxaoiJ5P9Fv4DLS63DpPZMaPPr63LQSba6an/X8SQW1F
 wesEJwGo4JmAzqcHtXkfzFjqWqLwiPIGkfiWAQEEVWIXy0KiwgPiID4CLh8oNGf2QE4L
 oMnBwWRUXXmq8b/G9vNjukYF3TjiQYfjtZ50CTj7AM+lZKrKH7DPJ32tDdThMa2rkBE4
 QZ5fEmkYrXC/KK+7mWFL8+mM9dUFjPx2IhQ2uAZKSely5VF+4GYckmZy2jflNlF8iB42
 qfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dVq3A/TrWA22YphYYB+8No5n6QtHAxN2b6l0mk2+kwE=;
 b=nmHnbvDJnHq6iDwHiIDxrWGs7PbVcXWYMBT7QF6PFeiHbkmNvxtU1mer7/6LcwmfzE
 RP9gQiP6w/xKQor2KNImutTZSTXV1eNEYHHTPq7/qLELikdDwttUgzjIEUCSFlav2HvE
 PNcabvsbUrYobJdLLoMWj+MEVWDfUbj/P9Lfl2+Pb6gOWUPRrEqEdCSy32SCrQZT8lpy
 f2oosvpwjM+XPomSADmWUG8UHIcGLZNvJjkuRct6QwWD6gtwlDkHl0utnREghklRpUXy
 j2jljy7Y8+LtrtR1lxqU4sc4ms7NkLlAPr3C6VQE0OIx0cizANjpFpnDV5iGvYRs0Vmz
 jtwg==
X-Gm-Message-State: APjAAAXE5TYaL9DboR6wmJHX1uv0MvmseMF2/GI0Hk/1/Dx1Vx8otIO6
 r/hGTCZmRG43O1lGaPeJaG8=
X-Google-Smtp-Source: APXvYqyT7gjrdIuAXN+Bwn4RKda6PPR1sKi1ETOlqbj7vb1Sy27HtwuzkOxhz14rXqUdFFOvXtIc3Q==
X-Received: by 2002:a25:ab21:: with SMTP id u30mr3900549ybi.143.1570377808701; 
 Sun, 06 Oct 2019 09:03:28 -0700 (PDT)
Received: from localhost.localdomain (072-189-084-142.res.spectrum.com.
 [72.189.84.142])
 by smtp.gmail.com with ESMTPSA id y129sm3341816ywy.41.2019.10.06.09.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 09:03:27 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Sun,  6 Oct 2019 12:03:09 -0400
Message-Id: <cover.1570377521.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: benjamin.gaignard@linaro.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, david@lechnology.com
Subject: [Linux-stm32] [PATCH v4 0/2] Simplify
	count_read/count_write/signal_read
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

Changes in v4:
 - Rebase ontop of ti-eqep introduction patches and update ti-eqep

The changes in this patchset will not affect the userspace interface.
Rather, these changes are intended to simplify the kernelspace Counter
callbacks for counter device driver authors.

The following main changes are proposed:

* Retire the opaque counter_count_read_value/counter_count_write_value
  structures and simply represent count data as an unsigned integer.

* Retire the opaque counter_signal_read_value structure and represent
  Signal data as a counter_signal_value enum.

These changes should reduce some complexity and code in the use and
implementation of the count_read, count_write, and signal_read
callbacks.

The opaque structures for Count data and Signal data were introduced
originally in anticipation of supporting various representations of
counter data (e.g. arbitrary-precision tallies, floating-point spherical
coordinate positions, etc). However, with the counter device drivers
that have appeared, it's become apparent that utilizing opaque
structures in kernelspace is not the best approach to take.

I believe it is best to let userspace applications decide how to
interpret the count data they receive. There are a couple of reasons why
it would be good to do so:

* Users use their devices in unexpected ways.

  For example, a quadrature encoder counter device is typically used to
  keep track of the position of a motor, but a user could set the device
  in a pulse-direction mode and instead use it to count sporadic rising
  edges from an arbitrary signal line unrelated to positioning. Users
  should have the freedom to decide what their data represents.

* Most counter devices represent data as unsigned integers anyway.

  For example, whether the device is a tally counter or position
  counter, the count data is represented to the user as an unsigned
  integer value. So specifying that one device is representing tallies
  while the other specifies positions does not provide much utility from
  an interface perspective.

For these reasons, the count_read and count_write callbacks have been
redefined to pass count data directly as unsigned long instead of passed
via opaque structures:

        count_read(struct counter_device *counter,
                   struct counter_count *count, unsigned long *val);
        count_write(struct counter_device *counter,
                    struct counter_count *count, unsigned long val);

Similarly, the signal_read is redefined to pass Signal data directly as
a counter_signal_value enum instead of via an opaque structure:

        signal_read(struct counter_device *counter,
                    struct counter_signal *signal,
                    enum counter_signal_value *val);

The counter_signal_value enum is simply the counter_signal_level enum
redefined to remove the references to the Signal data "level" data type.

William Breathitt Gray (2):
  counter: Simplify the count_read and count_write callbacks
  docs: driver-api: generic-counter: Update Count and Signal data types

 Documentation/driver-api/generic-counter.rst |  22 ++--
 drivers/counter/104-quad-8.c                 |  33 ++----
 drivers/counter/counter.c                    | 101 +++----------------
 drivers/counter/ftm-quaddec.c                |  14 +--
 drivers/counter/stm32-lptimer-cnt.c          |   5 +-
 drivers/counter/stm32-timer-cnt.c            |  17 +---
 drivers/counter/ti-eqep.c                    |  19 ++--
 include/linux/counter.h                      |  74 ++------------
 8 files changed, 59 insertions(+), 226 deletions(-)


base-commit: 0c3aa63a842d84990bd02622f2fa50d2bd33c652
prerequisite-patch-id: ebe284609b3db8d4130ea2915f7f7b185c743a70
prerequisite-patch-id: cbe857759f10d875690df125d18bc04f585ac7c9
prerequisite-patch-id: 21f2660dc88627387ee4666d08044c63dd961dae
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
