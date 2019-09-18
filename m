Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5472B5E4D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE9BC35E01;
	Wed, 18 Sep 2019 07:53:18 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FF45C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 205so3841073pfw.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSMOl3iSrRpXlHeE5xjCiDIndldeUrDABtlwaJ/jr9M=;
 b=kCTU1lN/PgnOcJLN5S3Tbdb11R26JjYMrwr/xRDnKpdsvfp4kOpnlm+orD+G61a8h5
 06cI5S1hCaEVAV2JyVDhiC6SSnlL8pm/F9JWfjFs++Ggqf89FEsnnrIa6SAVMvzBlh/b
 2CPyZTfzW2Pmjvctg1MB5kqgTGmTjrM+2gsE8kJS3n6gKM7IkPYf02Jd+KMhcZsm1KDO
 /G66GWGvd/6ic1i+FLo/q1Kn3Ou3KirFBjRNiz5UnazFOXu6Y4iNwAcNxX8f+tfweXeL
 BOn5S4lFE0f/9pSQocEHor1eDcxMIYyp5SAsWxlDCaOlHsUBAw98h8FFzdqt8XfMyYyH
 X3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hSMOl3iSrRpXlHeE5xjCiDIndldeUrDABtlwaJ/jr9M=;
 b=db4Ny6mMYuEMImN+ZPRWqUWF+f2nZ4IBaqRmtoK3ZzUEJngsYvQ8aqDS6Z84OGix1T
 AAp5aR6TfTxU28C0a792YPAXG66HRg+PvkLOhEN+xZmj7V6w7+Hegtigm6xjMUc8z5tQ
 mpc7Zv4lHOSYbjb4OoNzVxQgnSLNgPEkdSuqivGwC64PkqN/YxNV5JDuSrEkgMQhohpt
 +EpSjFz/C66S2c7TH8ZlF2Ylu1XTzeQ5JSlY/Xtu9Vd70lBM+2XDednsICpXt7IrGk0E
 RWlphYsmSSsrrrqEwR6aJ9Ru04kPojrxWheSRUkPF8dhjXyTyIY717A/QP5d47Omhv9R
 J/2w==
X-Gm-Message-State: APjAAAWcliTev63TGFvNk/lz+OdGaiBuvHp0e3uB2mWa9v3MNw1zJpbH
 tWHsLYH+BWArB0U3wbTt0D4=
X-Google-Smtp-Source: APXvYqwvVW9jJdHy5gE8lLIbwy8ELcp/zN9mDprxNkj63ZlbaO61Y0JTesXzYUV6appyqECbirGFMA==
X-Received: by 2002:a63:70d:: with SMTP id 13mr2796186pgh.326.1568793194471;
 Wed, 18 Sep 2019 00:53:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:13 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:41 +0900
Message-Id: <cover.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/7] counter: Simplify
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

Changes in v2:
 - Update the rest of the drivers under drivers/counter

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

William Breathitt Gray (7):
  counter: Simplify the count_read and count_write callbacks
  counter: Simplify the signal_read callback
  docs: driver-api: generic-counter: Update Count and Signal data types
  counter: 104-quad-8: Update count_read/count_write/signal_read
    callbacks
  counter: ftm-quaddec: Update count_read and count_write callbacks
  counter: stm32-lptimer-cnt: Update count_read callback
  counter: stm32-timer-cnt: Update count_read and count_write callbacks

 Documentation/driver-api/generic-counter.rst |  22 ++--
 drivers/counter/104-quad-8.c                 |  33 ++----
 drivers/counter/counter.c                    | 101 +++----------------
 drivers/counter/ftm-quaddec.c                |  14 +--
 drivers/counter/stm32-lptimer-cnt.c          |   5 +-
 drivers/counter/stm32-timer-cnt.c            |  17 +---
 include/linux/counter.h                      |  74 ++------------
 7 files changed, 53 insertions(+), 213 deletions(-)

-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
