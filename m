Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588734267E3
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:30:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F33DC597B4;
	Fri,  8 Oct 2021 10:30:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEF5BC597B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:30:50 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so9138969pjw.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1vSaD+K23J62kBXc5f4Gf9so221KhPSbs4YJD+VvKhA=;
 b=U8EW2wp4qReShlnXay4S7ydyIdzCH1AH1qjdK/kM3W8kwER3PTtks27vVJ0xrfvtSK
 zxMgaFDnyCI/7OMW4crF0kD8majo0M0i2HwDr4udB8nGh9J9k0gEfKlmUBdCERqGq+Qh
 YSQ5p4wM8vP2XQUrIuAzh6XQQEmsP9xHR8XylX/4XHbhLDeBQKY8NlzrqwP0TvFftj0/
 oZ0Lmyv0CAvZ950EzxJt0zHa2iVqSZ8nH2F8edSjyOV2WAXkhLQyPvdCXcbtT+W+81Km
 4d0/MA0IzpShkLnWF0ujND8ItL44WmrYJp4NYU/oBdob6ONaX5KujMZJ+PoiP7ZahbXU
 3BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1vSaD+K23J62kBXc5f4Gf9so221KhPSbs4YJD+VvKhA=;
 b=I9vQ6jtGqVOx8WIqyRsmyrYW30FVDw2hr6CV0n6H8+7GqqrXviGVh2wS1buC4nWQEa
 skAL9BqpaubxLSJHpdbD4zQvVammn53y3nxMOH6OVS9NLN7CFANs+5uWUhYO1CyAO680
 AYq+fq/VLNK7c7x396BQTz7R0ypzM6D6A42ZG+L8WlWE+uELsA8rcpL9NcOje2RQblEW
 A2YfuvsG01mK0I2M9qD/RjUW1XsAZt0fY5hR/YB/EIGU7ENbGoXcZaiJhl4ajTqWW3F1
 XclloMVo5FU6SYJ5zBLP7Llf/2l9gAVmcW7T0U3AIklD6BIU5YMPrmOp9qGOs3KkrLJE
 f97A==
X-Gm-Message-State: AOAM5313SVPBzY7K0Qq007Ro29xKtzekSimjumqS9H3+h7Bdw26e9o8w
 12inP54M4KE0Lrao54Sv0NM=
X-Google-Smtp-Source: ABdhPJxey6T8s1PJUjASu05BTCcAI3nvN2CVUF/29EAPQeI+8ooJJU3yNkiEDyDglxjMU73hKrRNAw==
X-Received: by 2002:a17:90a:17cd:: with SMTP id
 q71mr11318543pja.129.1633689049513; 
 Fri, 08 Oct 2021 03:30:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id y15sm2620151pfa.64.2021.10.08.03.30.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Oct 2021 03:30:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Fri,  8 Oct 2021 18:30:10 +0800
Message-Id: <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color
	effects control
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Dillon Min <dillon.minfei@gmail.com>

- add V4L2_COLORFX_SET_ARGB color effects control.
- add V4L2_CID_COLORFX_ARGB for ARGB color setting.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v3: according to Hans's suggestion, thanks.
- remove old stm32 private R2M ioctl
- add V4L2_CID_COLORFX_ARGB
- add V4L2_COLORFX_SET_ARGB

 Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
 include/uapi/linux/v4l2-controls.h                | 4 +++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index f8d0b923da20..319606a6288f 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -242,8 +242,16 @@ Control IDs
     * - ``V4L2_COLORFX_SET_CBCR``
       - The Cb and Cr chroma components are replaced by fixed coefficients
 	determined by ``V4L2_CID_COLORFX_CBCR`` control.
+    * - ``V4L2_COLORFX_SET_ARGB``
+      - ARGB colors.
 
 
+``V4L2_CID_COLORFX_ARGB`` ``(integer)``
+    Determines the Alpha, Red, Green, and Blue coefficients for
+    ``V4L2_COLORFX_SET_ARGB`` color effect.
+    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
+    bits [15:8] as Green component, bits [23:16] as Red component, and
+    bits [31:24] as Alpha component.
 
 ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
     Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 421300e13a41..53be6aadb289 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:	return "Min Number of Output Buffers";
 	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
 	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
+	case V4L2_CID_COLORFX_ARGB:		return "Color Effects, ARGB";
 
 	/*
 	 * Codec controls
@@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = *max = *step = *def = 0;
 		break;
 	case V4L2_CID_BG_COLOR:
+	case V4L2_CID_COLORFX_ARGB:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*step = 1;
 		*min = 0;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5532b5f68493..2876c2282a68 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -128,6 +128,7 @@ enum v4l2_colorfx {
 	V4L2_COLORFX_SOLARIZATION		= 13,
 	V4L2_COLORFX_ANTIQUE			= 14,
 	V4L2_COLORFX_SET_CBCR			= 15,
+	V4L2_COLORFX_SET_ARGB			= 16,
 };
 #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
 #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
@@ -145,9 +146,10 @@ enum v4l2_colorfx {
 
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
+#define V4L2_CID_COLORFX_ARGB			(V4L2_CID_BASE+43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
 
 /* USER-class private control IDs */
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
