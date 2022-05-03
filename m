Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA970517E41
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 09:15:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54CEFC60462;
	Tue,  3 May 2022 07:15:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66356C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 07:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651562151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
 b=iymczZXtFwrJKomltXqSKkBNeO22qbedAaYbzktKzf4spQn6ncMktSdP2Hh6HhI7XEeDs4
 ZCiPY94feiyF+rgG5/g6eJ9wlZU5QlODfAihCiAjDyj81wGG/ICO2HWLSJNaw2WAUP//a5
 UCy9cNgQUvw2thOCOm/RQxm94PSSkIU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-oUfG65C_MfK9TV0zIEBMvg-1; Tue, 03 May 2022 03:15:50 -0400
X-MC-Unique: oUfG65C_MfK9TV0zIEBMvg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l7-20020adfbd87000000b0020ac0a4d23dso6093937wrh.17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 May 2022 00:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
 b=59xO/JeCo8BKuAerALYtUXWpKXFswwlW2KxW3kDiT5AoT/HVY4tSDJKXpJT2R7pQ4L
 20rjzpGQlMYTs+ux8h4Z7KvkXNm7lTdWKMUSpt2F2OqihTV3msmYodbhV6gxHlWCGnd3
 wAGqQqVBIInt0DC2idXVsofEey4klfo0IYPwXKnmHlOO/tQv62jzrUZ7VOCbCmCwBh8u
 qJt7aK/63zfJGE3a9diW9j1/CGtd8IRy0Py5kyjv/h1nrOTuI6Su5mJlj+iXU/pEKf2F
 WqiKRo8WAsvkGTHDbbaXXrw+2D7aByww9V9WakxkNmTUfXIl6cC27UUQj63pV3PklJBt
 u5Iw==
X-Gm-Message-State: AOAM532g5ySSPECBw5XzDbtZN+GRINAUItvW+iXy5iXcgY+sb1q/N9Pt
 aiq9rTpQHbfXypCgvrEQZGOaH6c6pCJSjsPVFrFyg7aK5gw171WgLKhquAvHmzPk+g5AMIyknUU
 bM5q8A9lxYt6YpZL3cT1WFSfsu0EDTy9s/VJTmSW6
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr1856908wrx.76.1651562149330; 
 Tue, 03 May 2022 00:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvXXP0f4w1nXpXqVVOb+Guc+0Jj2Rw1NklRnskTnVt1GV+W8d6q/MLtZExFVKZCb9QVoENKA==
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr1856886wrx.76.1651562149040; 
 Tue, 03 May 2022 00:15:49 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003942a244f33sm1035387wmp.12.2022.05.03.00.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 00:15:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  3 May 2022 09:15:37 +0200
Message-Id: <20220503071540.471667-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [Linux-stm32] [PATCH v3 0/3] drm: Allow simpledrm to setup its
	emulated FB as firmware provided
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

Hello,

This series contain patches suggested by Thomas Zimmermann as a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

This is a v2 that addresses issues pointed out in v1.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

The patches were tested on a rpi4 board with the vc4 DRM driver built as a
module and either simplefb or simpledrm built-in.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v3:
- Drop the preferred_bpp local variable (Laurent Pinchart).
- Add a const qualifier to options parameter (Laurent Pinchart).
- Drop the firmware local variable (Laurent Pinchart).
- Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
  the kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 34 ++++++++++++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 24 ++++++++++++-
 36 files changed, 85 insertions(+), 45 deletions(-)

-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
