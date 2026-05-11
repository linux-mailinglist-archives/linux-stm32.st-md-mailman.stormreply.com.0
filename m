Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM0tNO7PAmq7xAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA951B62B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFAD1C87EC1;
	Tue, 12 May 2026 06:59:57 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21E61C87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 17:12:15 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5a85b30dd54so4667313e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778519534; x=1779124334;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
 b=AF2hsYSXLMIe1SvPZvWSy3vgflK0ChmAJ6dRgFbV+ngOqxEQb5RLsr1dFXILTQ4i/z
 ICAS4SOwrVQkk3Yn6ovPOpqW4J79hDHYylEXqv8ixCESry3e0+3ekV+mSQ07dFMBlcrB
 ZGLxC6zrmvqSYbnyTCDT/JyvjiBVSdepgfbrRKYdEt+X6vkXygFivKc0do9V1v4gEq+K
 Xj1ZKg5JoAaExIH9FvtJNXPu0GKByWvdtqHuFsNRJ2rmtx8t3Ty0OwlJ+7h0fPF9qMGY
 sR72cLPbKf22ZmqbXqUCYuPzo1rrACcf4VxmwQRe0aZLeZGfoQTiiDclg2ai7o8hlOhg
 Ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778519534; x=1779124334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ffx9yq19kp+YfhQJua5Fc4ABV19E4122HD3QSi0Mg4=;
 b=XKufmhwULiYUHrMAAJu+ItE+eNWln0oGKvSW7pDhv5Z+ukuU6fHxMAVSwAaQ+IBhm2
 oM3sSThD/SjcenfPTLpdwKmmI2lolhA3rQt99FSWWjPJ+vGCpdkk8RRNeW7VwpUV8aPG
 zIEiu55q5hHvcfNgibGO2PgyjZAxwanR7bAmOnWJJKhZzKZ4Ie9knr1Ii+XIcVHnsySq
 sbGXUxc8P3OYFJPMZGxLKmUrhr9XNDWt0ROVQyIXEblKzWdtUjTEOOdYWsnAaJH3YNN0
 kG9/Z7ANsR6nGGdfLBOGsEm2BlXcbkNZi1vyvuSut+Q9ptWXXsu4hBBiYhJwcJhkQYDR
 +DxQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ezd0vhQZi8F/Kn+eK5M6i6x4aKsZ9WC0h6NaIsvqq5kaWbHiA2+BHREcnGs0nEjjDS7ubLvJmz0qcqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwAV75bUQP4zDR/j7p/5drAqn4Lx6gZ9BYiApF6vTaqtIIUORK
 Kpz7GmhpAKNr+d3+jpe3HpeikvdHq7r7I7KyE3EkSuogLW9/mvIs0eVz
X-Gm-Gg: Acq92OEzKCme3bu3Xy0q8DQ7e4wVoiQFrwIEQqCE+NzENRfpPp2g/psV8mL4v8tSHqq
 Gt/7HmaYR2CtdcDGlj30N+o/6lDlsJbr1GhN4FsUJCuqd8utcBLhVBZWXePreAZ/i9hYFkItUSI
 uzDHInLLqazrtdQlLnxDfnNi5SNibNEI5/auiPGVPeT9Bh3t7X6TlfmdkiwlKzTzrkoFk3VRJ6q
 d8NYI9/QTMxRIQ1tJXfMf4opLYCXfYfiUEiaxqBqA1nRT6Xn5d+0jAjrtHUgoXjmaZfTxlKCRjC
 n1IOJiUlBI+c+AP9ifgIsiyyixRFybcyYQQtUuNNsNaauouZZV/wnzDkpKwyKsKYG6h7tEpt3OV
 bcTDgCtAAZLQiEZySv1jZOIIEM/TW9THuYb5RNvlUYmQ1JtRUG9hn6GxKh5aeewBGqFu8Oysxw7
 5pj6NmCTMjinErXM27aRX9b9exiDikcGBbbTWtUw7ZN2Mzcc5qQZaZYappkQob
X-Received: by 2002:a05:6512:3d9f:b0:5a8:6931:ddea with SMTP id
 2adb3069b0e04-5a887add27dmr10425983e87.3.1778519533815; 
 Mon, 11 May 2026 10:12:13 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 10:12:13 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 11 May 2026 20:12:05 +0300
Message-ID: <cover.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2026 06:59:56 +0000
Cc: linux-arm-kernel@lists.infradead.org, wens@kernel.org,
 linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 samuel@sholland.org, hugues.fruchet@foss.st.com, mripard@kernel.org,
 linux-sunxi@lists.linux.dev, hverkuil@kernel.org, jernej.skrabec@gmail.com,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, hansg@kernel.org,
 Valery Borovsky <vebohr@gmail.com>
Subject: [Linux-stm32] [PATCH 0/6] media: vb2: Return queued buffers from
	start_streaming() on error
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
X-Rspamd-Queue-Id: 69DA951B62B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,vger.kernel.org,linux.intel.com,sholland.org,foss.st.com,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:wens@kernel.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:samuel@sholland.org,m:hugues.fruchet@foss.st.com,m:mripard@kernel.org,m:linux-sunxi@lists.linux.dev,m:hverkuil@kernel.org,m:jernej.skrabec@gmail.com,m:mcoquelin.stm32@gmail.com,m:mchehab@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:hansg@kernel.org,m:vebohr@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.476];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

The vb2 framework hands buffer ownership to the driver via buf_queue()
before calling start_streaming().  If start_streaming() returns an
error without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count != 0) and the
queued buffers leak.

This was previously fixed for uvcvideo in commit 4cf3b6fd54eb ("media:
uvcvideo: Return queued buffers on start_streaming() failure").  The
same pattern exists in six sibling drivers that still return an errno
early (USB disconnect, signal-interrupted mutex, or media-graph /
format lookup failure) without draining their internal queued-buffer
list.  Each patch reuses or extends the helper / cleanup label that
the driver's other error paths already use.

  airspy.c          - moves mutex_lock above the !s->udev check and
                      jumps to the existing err_clear_bit label, which
                      already drains s->queued_bufs.
  msi2500.c         - rebuilds start_streaming into a goto chain that
                      drains the queue on every failure (including
                      previously-masked set_usb_adc / ctrl_msg paths);
                      parameterizes msi2500_cleanup_queued_bufs() with
                      vb2_buffer_state so the start_streaming path
                      passes _QUEUED.  Rolls back isoc_init via
                      msi2500_isoc_cleanup() on ctrl_msg failure.
  pwc-if.c          - calls pwc_cleanup_queued_bufs(.., _QUEUED) before
                      each early return; state matches the existing
                      pwc_isoc_init() error-path in the same function.
  rtl2832_sdr.c     - calls rtl2832_sdr_cleanup_queued_bufs() before
                      each early return and at the err label.  Adds an
                      explicit success return so the cleanup at err no
                      longer runs on the success path.  Parameterizes
                      the helper with vb2_buffer_state.
  dcmipp-bytecap.c  - replaces the bare -EINVAL return for failed
                      subdev lookup with a goto err_buffer_done.
  sun4i_dma.c       - replaces the bare -EINVAL return for failed
                      csi-format lookup with a goto err_clear_dma_queue.

These sites were located by a Coccinelle pattern that matches
`return -ERRNO` inside a start_streaming(struct vb2_queue *, unsigned
int) callback without a preceding vb2_buffer_done() on the same path.

Build-tested with drivers/media/ allmodconfig.  Not runtime-tested on
any of the six devices.  Maintainers with hardware are kindly asked to
verify nothing regresses on their device.

Valery Borovsky (6):
  media: airspy: Return queued buffers on start_streaming() failure
  media: msi2500: Return queued buffers on start_streaming() failure
  media: pwc: Return queued buffers on start_streaming() failure
  media: rtl2832_sdr: Return queued buffers on start_streaming() failure
  media: stm32-dcmipp: Return queued buffers on start_streaming()
    failure
  media: sun4i-csi: Return queued buffers on start_streaming() failure

 drivers/media/dvb-frontends/rtl2832_sdr.c     | 19 ++++++++---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c    |  6 ++--
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  6 ++--
 drivers/media/usb/airspy/airspy.c             |  8 +++--
 drivers/media/usb/msi2500/msi2500.c           | 32 ++++++++++++++-----
 drivers/media/usb/pwc/pwc-if.c                |  8 +++--
 6 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
