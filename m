Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 669EA5A7CB0
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Aug 2022 13:58:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B2FEC640FB;
	Wed, 31 Aug 2022 11:58:37 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 718A5C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 09:32:40 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-11dca1c9c01so22842187fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Aug 2022 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=r0pqxpxh0JXFJUKOyW8tX5PwY1Kx10iibAkBXkH5gns=;
 b=mhMPjIXWxbZyoN+JAVHx2pWRBNiqzWWUwzVdtSZXBaSKRX3YS4q6/aXB7NhUjqEGWX
 S03WMXZjmh/hZNmx2tBVwn5WoAu/cRw1JGHJQ4nxkjrurzGCopwWwB9hmQqKEi80bJKs
 a4dRoWnrn3FxfidK/02OEDCils4LzdcnT4rMcMkh+qpoXMSqUsQvrCvHyOSl+bInIkeQ
 VoKAunQwjOjopmipQTjj798ZIpGYf8YuUt5mU//RsR015OZzRIdhGr60pEr6bISqfH74
 gG35TUknAu0/wu1DHV0mSd0HL7ifz46UDo/CHwpFG/Qt1lWprF++G15Z1mHnlzrnZBFZ
 8M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=r0pqxpxh0JXFJUKOyW8tX5PwY1Kx10iibAkBXkH5gns=;
 b=pV07uOGimbdDSO21bmoARtoJtO0KNtoNQw2/edUFbZjn8HhwshUPvzb2/RkXdDVUXH
 +d/FoU/nyDM25HIe2MJXSscaWnJonTk37L/xvqRg185VFnIumPKNZl2WF26IT6UU9QKb
 YEYsP+suPY2RdirESQLzGDmdvwsnuQqJW9dCvTz3nN5wFn142NXWkUMP0/2dUTG6t3Rm
 Ecf8rvmg9qFuh5rYK5NcGpyKzAfeHz47DN/s+9d0MMHsDIGhletYXf6SeIuOsux59mLS
 mcVd6LMLG9BkuFCupl/eP5hhyhd47UZn09MNO8CxOv8ClG+LJGFySBpLGrqEw7FtHUNV
 6u7Q==
X-Gm-Message-State: ACgBeo27ySfncYAEbMOUeTl6C2m1EKyIcTKM8YO72OVUKvWmFzAJozt6
 jRRUyEQtMTrbyHF1k0SvjgOpT71BX+Bo0iXj1tSkyA==
X-Google-Smtp-Source: AA6agR4G2DS+hj+ntbazk41f0aGksxClIUZBQtd06Y92Xq52+NX9dJTb0pJ2RpugqWGNQ9HRl+QvTxRkozrFOeLh/g0=
X-Received: by 2002:a05:6808:8db:b0:344:fb71:2159 with SMTP id
 k27-20020a05680808db00b00344fb712159mr799223oij.34.1661938359203; Wed, 31 Aug
 2022 02:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220830172614.340962-1-james.clark@arm.com>
 <20220830172614.340962-4-james.clark@arm.com>
In-Reply-To: <20220830172614.340962-4-james.clark@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 31 Aug 2022 10:32:28 +0100
Message-ID: <CAJ9a7VgxF1tr6yoE-k=+VnYi9suELk7EacJFxSDFxW_-XG=UKA@mail.gmail.com>
To: James Clark <james.clark@arm.com>
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:58:36 +0000
Cc: mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, leo.yan@linaro.org,
 german.gomez@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] coresight: Re-use same function
 for similar sysfs register accessors
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

On Tue, 30 Aug 2022 at 18:26, James Clark <james.clark@arm.com> wrote:
>
> Currently each accessor macro creates an identical function which wastes
> space in the text area and pollutes the ftrace function names. Change it
> so that the same function is used, but the register to access is passed
> in as parameter rather than baked into each function.
>
> Signed-off-by: James Clark <james.clark@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-catu.c  | 25 ++++-------
>  drivers/hwtracing/coresight/coresight-core.c  | 14 ++++++
>  drivers/hwtracing/coresight/coresight-etb10.c | 25 ++++-------
>  .../coresight/coresight-etm3x-sysfs.c         | 31 +++++--------
>  drivers/hwtracing/coresight/coresight-priv.h  | 40 +++++++++--------
>  .../coresight/coresight-replicator.c          |  7 +--
>  drivers/hwtracing/coresight/coresight-stm.c   | 37 ++++++----------
>  .../hwtracing/coresight/coresight-tmc-core.c  | 43 ++++++-------------
>  8 files changed, 91 insertions(+), 131 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 9d89c4054046..bc90a03f478f 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -365,24 +365,15 @@ static const struct etr_buf_operations etr_catu_buf_ops = {
>         .get_data = catu_get_data_etr_buf,
>  };
>
> -coresight_simple_reg32(devid, CORESIGHT_DEVID);
> -coresight_simple_reg32(control, CATU_CONTROL);
> -coresight_simple_reg32(status, CATU_STATUS);
> -coresight_simple_reg32(mode, CATU_MODE);
> -coresight_simple_reg32(axictrl, CATU_AXICTRL);
> -coresight_simple_reg32(irqen, CATU_IRQEN);
> -coresight_simple_reg64(sladdr, CATU_SLADDRLO, CATU_SLADDRHI);
> -coresight_simple_reg64(inaddr, CATU_INADDRLO, CATU_INADDRHI);
> -
>  static struct attribute *catu_mgmt_attrs[] = {
> -       &dev_attr_devid.attr,
> -       &dev_attr_control.attr,
> -       &dev_attr_status.attr,
> -       &dev_attr_mode.attr,
> -       &dev_attr_axictrl.attr,
> -       &dev_attr_irqen.attr,
> -       &dev_attr_sladdr.attr,
> -       &dev_attr_inaddr.attr,
> +       coresight_simple_reg32(devid, CORESIGHT_DEVID),
> +       coresight_simple_reg32(control, CATU_CONTROL),
> +       coresight_simple_reg32(status, CATU_STATUS),
> +       coresight_simple_reg32(mode, CATU_MODE),
> +       coresight_simple_reg32(axictrl, CATU_AXICTRL),
> +       coresight_simple_reg32(irqen, CATU_IRQEN),
> +       coresight_simple_reg64(sladdr, CATU_SLADDRLO, CATU_SLADDRHI),
> +       coresight_simple_reg64(inaddr, CATU_INADDRLO, CATU_INADDRHI),
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 1edfec1e9d18..c63b2167a69f 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -60,6 +60,20 @@ EXPORT_SYMBOL_GPL(coresight_barrier_pkt);
>
>  static const struct cti_assoc_op *cti_assoc_ops;
>
> +ssize_t coresight_simple_show(struct device *_dev,
> +                             struct device_attribute *attr, char *buf)
> +{
> +       struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
> +       struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
> +       u64 val;
> +
> +       pm_runtime_get_sync(_dev->parent);
> +       val = csdev_access_relaxed_read_pair(&csdev->access, cs_attr->lo_off, cs_attr->hi_off);
> +       pm_runtime_put_sync(_dev->parent);
> +       return sysfs_emit(buf, "0x%llx\n", val);
> +}
> +EXPORT_SYMBOL_GPL(coresight_simple_show);
> +
>  void coresight_set_cti_ops(const struct cti_assoc_op *cti_op)
>  {
>         cti_assoc_ops = cti_op;
> diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
> index 405bb3355cb1..8aa6e4f83e42 100644
> --- a/drivers/hwtracing/coresight/coresight-etb10.c
> +++ b/drivers/hwtracing/coresight/coresight-etb10.c
> @@ -655,24 +655,15 @@ static const struct file_operations etb_fops = {
>         .llseek         = no_llseek,
>  };
>
> -coresight_simple_reg32(rdp, ETB_RAM_DEPTH_REG);
> -coresight_simple_reg32(sts, ETB_STATUS_REG);
> -coresight_simple_reg32(rrp, ETB_RAM_READ_POINTER);
> -coresight_simple_reg32(rwp, ETB_RAM_WRITE_POINTER);
> -coresight_simple_reg32(trg, ETB_TRG);
> -coresight_simple_reg32(ctl, ETB_CTL_REG);
> -coresight_simple_reg32(ffsr, ETB_FFSR);
> -coresight_simple_reg32(ffcr, ETB_FFCR);
> -
>  static struct attribute *coresight_etb_mgmt_attrs[] = {
> -       &dev_attr_rdp.attr,
> -       &dev_attr_sts.attr,
> -       &dev_attr_rrp.attr,
> -       &dev_attr_rwp.attr,
> -       &dev_attr_trg.attr,
> -       &dev_attr_ctl.attr,
> -       &dev_attr_ffsr.attr,
> -       &dev_attr_ffcr.attr,
> +       coresight_simple_reg32(rdp, ETB_RAM_DEPTH_REG),
> +       coresight_simple_reg32(sts, ETB_STATUS_REG),
> +       coresight_simple_reg32(rrp, ETB_RAM_READ_POINTER),
> +       coresight_simple_reg32(rwp, ETB_RAM_WRITE_POINTER),
> +       coresight_simple_reg32(trg, ETB_TRG),
> +       coresight_simple_reg32(ctl, ETB_CTL_REG),
> +       coresight_simple_reg32(ffsr, ETB_FFSR),
> +       coresight_simple_reg32(ffcr, ETB_FFCR),
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 12f8e8176c7e..fd81eca3ec18 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -1252,28 +1252,17 @@ static struct attribute *coresight_etm_attrs[] = {
>         NULL,
>  };
>
> -coresight_simple_reg32(etmccr, ETMCCR);
> -coresight_simple_reg32(etmccer, ETMCCER);
> -coresight_simple_reg32(etmscr, ETMSCR);
> -coresight_simple_reg32(etmidr, ETMIDR);
> -coresight_simple_reg32(etmcr, ETMCR);
> -coresight_simple_reg32(etmtraceidr, ETMTRACEIDR);
> -coresight_simple_reg32(etmteevr, ETMTEEVR);
> -coresight_simple_reg32(etmtssvr, ETMTSSCR);
> -coresight_simple_reg32(etmtecr1, ETMTECR1);
> -coresight_simple_reg32(etmtecr2, ETMTECR2);
> -
>  static struct attribute *coresight_etm_mgmt_attrs[] = {
> -       &dev_attr_etmccr.attr,
> -       &dev_attr_etmccer.attr,
> -       &dev_attr_etmscr.attr,
> -       &dev_attr_etmidr.attr,
> -       &dev_attr_etmcr.attr,
> -       &dev_attr_etmtraceidr.attr,
> -       &dev_attr_etmteevr.attr,
> -       &dev_attr_etmtssvr.attr,
> -       &dev_attr_etmtecr1.attr,
> -       &dev_attr_etmtecr2.attr,
> +       coresight_simple_reg32(etmccr, ETMCCR),
> +       coresight_simple_reg32(etmccer, ETMCCER),
> +       coresight_simple_reg32(etmscr, ETMSCR),
> +       coresight_simple_reg32(etmidr, ETMIDR),
> +       coresight_simple_reg32(etmcr, ETMCR),
> +       coresight_simple_reg32(etmtraceidr, ETMTRACEIDR),
> +       coresight_simple_reg32(etmteevr, ETMTEEVR),
> +       coresight_simple_reg32(etmtssvr, ETMTSSCR),
> +       coresight_simple_reg32(etmtecr1, ETMTECR1),
> +       coresight_simple_reg32(etmtecr2, ETMTECR2),
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index cf8ae768106e..07b392bfdbcd 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -39,24 +39,30 @@
>
>  #define ETM_MODE_EXCL_KERN     BIT(30)
>  #define ETM_MODE_EXCL_USER     BIT(31)
> +struct cs_pair_attribute {
> +       struct device_attribute attr;
> +       s32 lo_off;
> +       s32 hi_off;
> +};
>
> -#define __coresight_simple_show(name, lo_off, hi_off)          \
> -static ssize_t name##_show(struct device *_dev,                                \
> -                          struct device_attribute *attr, char *buf)    \
> -{                                                                      \
> -       struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev); \
> -       u64 val;                                                        \
> -       pm_runtime_get_sync(_dev->parent);                              \
> -       val = csdev_access_relaxed_read_pair(&csdev->access, lo_off, hi_off);   \
> -       pm_runtime_put_sync(_dev->parent);                              \
> -       return scnprintf(buf, PAGE_SIZE, "0x%llx\n", val);              \
> -}                                                                      \
> -static DEVICE_ATTR_RO(name)
> -
> -#define coresight_simple_reg32(name, offset)                   \
> -       __coresight_simple_show(name, offset, -1)
> -#define coresight_simple_reg64(name, lo_off, hi_off)           \
> -       __coresight_simple_show(name, lo_off, hi_off)
> +extern ssize_t coresight_simple_show(struct device *_dev,
> +                                    struct device_attribute *attr, char *buf);
> +
> +#define coresight_simple_reg32(name, offset)                           \
> +       (&((struct cs_pair_attribute[]) {                               \
> +          {                                                            \
> +               __ATTR(name, 0444, coresight_simple_show, NULL),        \
> +               offset, -1                                              \
> +          }                                                            \
> +       })[0].attr.attr)
> +
> +#define coresight_simple_reg64(name, lo_off, hi_off)                   \
> +       (&((struct cs_pair_attribute[]) {                               \
> +          {                                                            \
> +               __ATTR(name, 0444, coresight_simple_show, NULL),        \
> +               lo_off, hi_off                                          \
> +          }                                                            \
> +       })[0].attr.attr)
>
>  extern const u32 coresight_barrier_pkt[4];
>  #define CORESIGHT_BARRIER_PKT_SIZE (sizeof(coresight_barrier_pkt))
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 7cffcbb2ec42..4dd50546d7e4 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -196,12 +196,9 @@ static const struct coresight_ops replicator_cs_ops = {
>         .link_ops       = &replicator_link_ops,
>  };
>
> -coresight_simple_reg32(idfilter0, REPLICATOR_IDFILTER0);
> -coresight_simple_reg32(idfilter1, REPLICATOR_IDFILTER1);
> -
>  static struct attribute *replicator_mgmt_attrs[] = {
> -       &dev_attr_idfilter0.attr,
> -       &dev_attr_idfilter1.attr,
> +       coresight_simple_reg32(idfilter0, REPLICATOR_IDFILTER0),
> +       coresight_simple_reg32(idfilter1, REPLICATOR_IDFILTER1),
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index 4a31905604fe..463f449cfb79 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -634,19 +634,6 @@ static ssize_t traceid_store(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(traceid);
>
> -coresight_simple_reg32(tcsr, STMTCSR);
> -coresight_simple_reg32(tsfreqr, STMTSFREQR);
> -coresight_simple_reg32(syncr, STMSYNCR);
> -coresight_simple_reg32(sper, STMSPER);
> -coresight_simple_reg32(spter, STMSPTER);
> -coresight_simple_reg32(privmaskr, STMPRIVMASKR);
> -coresight_simple_reg32(spscr, STMSPSCR);
> -coresight_simple_reg32(spmscr, STMSPMSCR);
> -coresight_simple_reg32(spfeat1r, STMSPFEAT1R);
> -coresight_simple_reg32(spfeat2r, STMSPFEAT2R);
> -coresight_simple_reg32(spfeat3r, STMSPFEAT3R);
> -coresight_simple_reg32(devid, CORESIGHT_DEVID);
> -
>  static struct attribute *coresight_stm_attrs[] = {
>         &dev_attr_hwevent_enable.attr,
>         &dev_attr_hwevent_select.attr,
> @@ -657,18 +644,18 @@ static struct attribute *coresight_stm_attrs[] = {
>  };
>
>  static struct attribute *coresight_stm_mgmt_attrs[] = {
> -       &dev_attr_tcsr.attr,
> -       &dev_attr_tsfreqr.attr,
> -       &dev_attr_syncr.attr,
> -       &dev_attr_sper.attr,
> -       &dev_attr_spter.attr,
> -       &dev_attr_privmaskr.attr,
> -       &dev_attr_spscr.attr,
> -       &dev_attr_spmscr.attr,
> -       &dev_attr_spfeat1r.attr,
> -       &dev_attr_spfeat2r.attr,
> -       &dev_attr_spfeat3r.attr,
> -       &dev_attr_devid.attr,
> +       coresight_simple_reg32(tcsr, STMTCSR),
> +       coresight_simple_reg32(tsfreqr, STMTSFREQR),
> +       coresight_simple_reg32(syncr, STMSYNCR),
> +       coresight_simple_reg32(sper, STMSPER),
> +       coresight_simple_reg32(spter, STMSPTER),
> +       coresight_simple_reg32(privmaskr, STMPRIVMASKR),
> +       coresight_simple_reg32(spscr, STMSPSCR),
> +       coresight_simple_reg32(spmscr, STMSPMSCR),
> +       coresight_simple_reg32(spfeat1r, STMSPFEAT1R),
> +       coresight_simple_reg32(spfeat2r, STMSPFEAT2R),
> +       coresight_simple_reg32(spfeat3r, STMSPFEAT3R),
> +       coresight_simple_reg32(devid, CORESIGHT_DEVID),
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 781d213526b7..07abf28ad725 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -251,36 +251,21 @@ static enum tmc_mem_intf_width tmc_get_memwidth(u32 devid)
>         return memwidth;
>  }
>
> -coresight_simple_reg32(rsz, TMC_RSZ);
> -coresight_simple_reg32(sts, TMC_STS);
> -coresight_simple_reg32(trg, TMC_TRG);
> -coresight_simple_reg32(ctl, TMC_CTL);
> -coresight_simple_reg32(ffsr, TMC_FFSR);
> -coresight_simple_reg32(ffcr, TMC_FFCR);
> -coresight_simple_reg32(mode, TMC_MODE);
> -coresight_simple_reg32(pscr, TMC_PSCR);
> -coresight_simple_reg32(axictl, TMC_AXICTL);
> -coresight_simple_reg32(authstatus, TMC_AUTHSTATUS);
> -coresight_simple_reg32(devid, CORESIGHT_DEVID);
> -coresight_simple_reg64(rrp, TMC_RRP, TMC_RRPHI);
> -coresight_simple_reg64(rwp, TMC_RWP, TMC_RWPHI);
> -coresight_simple_reg64(dba, TMC_DBALO, TMC_DBAHI);
> -
>  static struct attribute *coresight_tmc_mgmt_attrs[] = {
> -       &dev_attr_rsz.attr,
> -       &dev_attr_sts.attr,
> -       &dev_attr_rrp.attr,
> -       &dev_attr_rwp.attr,
> -       &dev_attr_trg.attr,
> -       &dev_attr_ctl.attr,
> -       &dev_attr_ffsr.attr,
> -       &dev_attr_ffcr.attr,
> -       &dev_attr_mode.attr,
> -       &dev_attr_pscr.attr,
> -       &dev_attr_devid.attr,
> -       &dev_attr_dba.attr,
> -       &dev_attr_axictl.attr,
> -       &dev_attr_authstatus.attr,
> +       coresight_simple_reg32(rsz, TMC_RSZ),
> +       coresight_simple_reg32(sts, TMC_STS),
> +       coresight_simple_reg64(rrp, TMC_RRP, TMC_RRPHI),
> +       coresight_simple_reg64(rwp, TMC_RWP, TMC_RWPHI),
> +       coresight_simple_reg32(trg, TMC_TRG),
> +       coresight_simple_reg32(ctl, TMC_CTL),
> +       coresight_simple_reg32(ffsr, TMC_FFSR),
> +       coresight_simple_reg32(ffcr, TMC_FFCR),
> +       coresight_simple_reg32(mode, TMC_MODE),
> +       coresight_simple_reg32(pscr, TMC_PSCR),
> +       coresight_simple_reg32(devid, CORESIGHT_DEVID),
> +       coresight_simple_reg64(dba, TMC_DBALO, TMC_DBAHI),
> +       coresight_simple_reg32(axictl, TMC_AXICTL),
> +       coresight_simple_reg32(authstatus, TMC_AUTHSTATUS),
>         NULL,
>  };
>
> --
> 2.28.0
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
