Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLpRCQNBBGokGQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:43 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B863953066D
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 11:14:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1578C87EC6;
	Wed, 13 May 2026 09:14:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90FBAC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 09:14:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so78723715e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663680; x=1779268480;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3M6rRLTQ9CGPGf8NA7+4xvB1DmVHioIYgHph20eH9Ks=;
 b=Ji7Z7INW07DbNS/CKyh8bAM2qklDNfapYpcfvRkXcYd6Gs+1zSekn0OcpQ4Tp0Q+oQ
 YGoMd2DUzi7cBGZLRmkMeDJ4sKQWS/L1rL5Lfuzast0FQa5wD6vL9o6bbLhjDkElZpR/
 nILQOd/mdesTLoG+dasJxdQ0vlbF+NxGx05e2+fAFBpK+bEUAtm7MGFJIo0qinF06WAC
 /Z6d0dzjDPnl/133sryWPPAHaHrfJvXFimjmP5JjWiJrN7OLCdIoIZfW07jM8/MZAOsb
 8tfPV83iCW5r0JBds2JcsHk3JB5keVSc5qqg4Wtqa8VTeglI+A+pWr3Qw6DfdFSDR2av
 FQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778663680; x=1779268480;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3M6rRLTQ9CGPGf8NA7+4xvB1DmVHioIYgHph20eH9Ks=;
 b=DlUHEX6LKVdGV3E5QWsCUDoasPLmlk0CDaDLhCF9+QurOPqmf7Wy9hP+HE3SxEaXmJ
 pk/ocs+1OgdJBL7WVLcoDPNPy5Gui+gHdAiDSTu0pcmETH+ke6K/O0tMi5e7fTTkMRTI
 qUi5O1krb1nudBwGwWsHR3jhp/mM0zOfR7/WF8bKEEXU7t1teQZ8d/c3sBMQ9qrazQDG
 h1UHYRs6PN19M2U6MzrwGWuzvYyiQwUmj5jkNiAEBCHNFRtmhO6FYjv1dz8CzPDuHSRs
 DTQfUd5ZFVBZcWE/OrRm2ZTOQpWs8Qvg0uMOX13IFOYNo9z09lwLi2c0DlsEWztLRrQU
 vViA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Tgt5UKEmrVmAL3qeR7cyyWa+KWhsfnlc7Wmh79JHJeZU3fyeC6xGawGYZf6Y3WI2Z3AaUn3kPrW3+fA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxvcP3u4ons0H0APumj7+GlK1Pdb75h0Hh9UYrQbfFowurjUdkA
 r8QJ8AJ2rSlCwlSRpdu13iTmBjPwOb6OHnoMAMhUkKv1xJ1iDv79jdlgpvA0Se+RU3k=
X-Gm-Gg: Acq92OGrmn8lb6/a+aLPZVBgF47bF9doS0OJqEnDma6oOKCycmdYtYjdERDIdrpsPst
 p3tjNd9llWWUZCY4780V4edbMvBIEHOuHr2OfOkNIWLNySFQOt2FphY/qTJKp9YRypjtWqlfXNf
 6GTqbf42Jl3D5dTdJ/lCrLMasFX01OFEnoSLVeNRNgGetO3HX72Qqo9fnSFokD4ksGjvDTgQ1Dk
 5tw5OWhdgvScmHlA1nfo7qDDXyp8dWUnuxQycD2cwxk9U/eoXNUzMfzNkWi+qLRQzaFthIdSL9V
 EJLlzhdPrcs3ELOQ44g9Z3ZOP7wXWaXq5jY6AD53o4jsAtId4rD7wzM/cjOMQ51YIxU3lV720Lz
 WlCcc0v7m/WYn74NFEhM9oiT1uTK/8M4myIE66exyckMM5YTF03pubnPr95h14VaYFsubaCXmVC
 dR8Ed661MK3/RNcFBqFRriK2vzUaxAiWjYfYrvicyJwQ==
X-Received: by 2002:a05:600c:c4ab:b0:485:30d4:6b9e with SMTP id
 5b1f17b1804b1-48fc9a3c1ffmr38082135e9.21.1778663679846; 
 Wed, 13 May 2026 02:14:39 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 02:14:39 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:24 +0200
Message-Id: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNyQrCMBgE4FeRnI38Wbp58j3EQ5rFRu1CUqul9
 N1N6kFwwePAzDcT8tpZ7dF2NSGnB+tt24RA1yskK9EcNbYqZESBpsAZ4JvtsO9r4c4UKyFxBik
 YXihVcIPCqnPa2Psi7g/P7K/lScs+MrFRWd+3blwuBxp7v/WBYsCaCZOnueQgyK4U48WWTm9kW
 6N4MLAXkQD/JFggIKFcECOJZN8I8ocggcgzLlkqeEFAvRHzPD8AnWT3ykkBAAA=
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/11] add mcf54415 DAC driver
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
X-Rspamd-Queue-Id: B863953066D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.669];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,baylibre.com:email,baylibre.com:mid]
X-Rspamd-Action: no action

This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
ibuiltin DACs.

Currently the driver enables the raw write only. Feature as dma, sync, or
format are not supoprted for this version.

Additional options suppoerted by the DAC module will be added to the driver
later on, as needed.

The same patchset prepares the m68k/coldfire architecture to support
the driver.

Below soem basic tests done on stmark2 mcf54415-based board, voltage check
on DAC0 and DAC1:

~ # cd /sys/bus/iio/devices/iio:device0/
/sys/bus/iio/devices/iio:device0 # ls
name               out_voltage_scale  uevent
out_voltage_raw    subsystem
/sys/bus/iio/devices/iio:device0 # cat name
mcf54415
/sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw 
/sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw 
sh: write error: Invalid argument
/sys/bus/iio/devices/iio:device0 # cat out_voltage_raw 
2048
/sys/bus/iio/devices/iio:device0 # 

Same behavior for /sys/bus/iio/devices/iio:device1.

Generated a sine wave by shell script, sine shape is good.

Note: this patchset depends on mew mcf_read/mcf_write implementation:
Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t

---
Changes in v2:
- keeping changelog in each single patch, where any
- Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com

---
Angelo Dureghello (11):
      m68k: mcf5441x: fix clocks numbering
      m68k: mcf5441x: add clock for DAC channel 1
      m68k: mcf5441x: setup DAC clock name as per driver name
      m68k: defconfig: update stmark2 defconfig
      m68k: add DAC modules base addresses
      m68k: mcf5441x: add CCM registers
      m68k: mcf5441x: add CCR MISCCR2 bitfields
      m68k: stmark2: add mcf5441x DAC platform devices
      m68k: stmark2: use ioport.h macros for resources
      m68k: stmark2: enable DACs outputs
      iio: dac: add mcf54415 DAC

 arch/m68k/coldfire/m5441x.c         |  21 ++--
 arch/m68k/coldfire/stmark2.c        |  51 ++++++---
 arch/m68k/configs/stmark2_defconfig |   2 +
 arch/m68k/include/asm/m5441xsim.h   |  42 ++++++++
 drivers/iio/dac/Kconfig             |  10 ++
 drivers/iio/dac/Makefile            |   1 +
 drivers/iio/dac/mcf54415_dac.c      | 203 ++++++++++++++++++++++++++++++++++++
 7 files changed, 306 insertions(+), 24 deletions(-)
---
base-commit: 25c66a1b49f3c5463ee8266a3fd5256cbc794610
change-id: 20260430-wip-stmark2-dac-7060f49dd94f

Best regards,
--  
Angelo Dureghello <adureghello@baylibre.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
