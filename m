Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673F377096
	for <lists+linux-stm32@lfdr.de>; Sat,  8 May 2021 10:07:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB000C59780;
	Sat,  8 May 2021 08:07:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 252A1C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 May 2021 08:07:42 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b15so229924plh.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 May 2021 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=U4tTles96vigyObNqu0ZrWU3gaC9EtN6g51/n4d5mZc=;
 b=h1oLaKVaYa3lklaNZj6wlW1TZTAH1lx3lrjrnCQn3mrW5RLs4YgQDTPYjmWWYT/x+5
 frlZAEEuNGJdWHc+zYkVu0Gt5uCn4zG7AOQUEWEYx6W+ypPpZFXPpAIKEcNLyWHAjjz1
 RHO8HUHL4D1/jgdjCD/GSlp1h3IqotNJ5YW4osmgNvZMFCj1Skw46E6db36EwP8PSNTm
 sl0IbYH3FLxVyCUXeuHB4HpKyCWumCYUxtXTFu+zE1D1GnUZD+sWaQ+pv9LswyIHk/eg
 iw5/1SRo0tR5Vx5jo9ClOjTgBGHCDHFjHC8DAFZPv3RbzHFa5KtWH+WughSU9lD75lJO
 QNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=U4tTles96vigyObNqu0ZrWU3gaC9EtN6g51/n4d5mZc=;
 b=drFSXN++/O8g4BsyTjMrpts4pOaz/lA/FdNqggvhWsPYfhm9k8dPijHZrSuIJVPlKM
 XojUA0qZ9arPTm5M2PGK4zkAsXtgj2LHzTUiPak/TbqgGLhVe3ppi8qkJ19mXv/+lBVk
 21ST/Bcb6dUoVZDc6CKTCBHLL35SudydLZdfu9BUqdSdghjzyM1EfmHxGgZj85sLqVqx
 jkWqvpRWUyvP4sn0v0SbbzXA8SPGx/djmpj7+Pm/AXCwR0urQaZ5v1ndZic5RnNZgjOW
 R1A+7hb6YAZOpU2nZ44qJmRDSJXR4603StpiPK0upH0WO/MV39rmtA//p4+K9UPlCOgw
 OfJg==
X-Gm-Message-State: AOAM532cp1bnMzAQWPbVDJb2IXp01ixhFo0f70z9YFLRYNOLf3b6gX/x
 tNaYxKFDbw88D3xB0jrJ4LUSh1tCWb/TCI/saYI=
X-Google-Smtp-Source: ABdhPJxmzBv0A+ULVjIpuCwJ5hREiJdG+Si1D/RiTfs9WZv3rAThW/qELffq55MaTPHD63KsSPXfeEe+OAYFL010Z2U=
X-Received: by 2002:a17:902:ecc6:b029:ee:af8f:899e with SMTP id
 a6-20020a170902ecc6b02900eeaf8f899emr14557278plh.21.1620461260974; Sat, 08
 May 2021 01:07:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:d81:0:0:0:0 with HTTP; Sat, 8 May 2021 01:07:40
 -0700 (PDT)
In-Reply-To: <20210508095506.4d0d628a@collabora.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
 <20210507131756.17028-2-patrice.chotard@foss.st.com>
 <20210508095506.4d0d628a@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 8 May 2021 11:07:40 +0300
Message-ID: <CAHp75VdV4yZJBcrCcrmkYzFNqGBZCODJZfDEG=3o8ieywc86SQ@mail.gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] spi: spi-mem: add automatic poll
	status functions
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
Content-Type: multipart/mixed; boundary="===============6688298487218600826=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6688298487218600826==
Content-Type: multipart/alternative; boundary="000000000000d5343705c1cd091c"

--000000000000d5343705c1cd091c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, May 8, 2021, Boris Brezillon <boris.brezillon@collabora.com>
wrote:

> On Fri, 7 May 2021 15:17:54 +0200
> <patrice.chotard@foss.st.com> wrote:
>
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > With STM32 QSPI, it is possible to poll the status register of the
> device.
> > This could be done to offload the CPU during an operation (erase or
> > program a SPI NAND for example).
> >
> > spi_mem_poll_status API has been added to handle this feature.
> > This new function take care of the offload/non-offload cases.
> >
> > For the non-offload case, use read_poll_timeout() to poll the status in
> > order to release CPU during this phase.
> >
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > ---
> > Changes in v2:
> >   - Indicates the spi_mem_poll_status() timeout unit
> >   - Use 2-byte wide status register
> >   - Add spi_mem_supports_op() call in spi_mem_poll_status()
> >   - Add completion management in spi_mem_poll_status()
> >   - Add offload/non-offload case mangement in spi_mem_poll_status()
> >   - Optimize the non-offload case by using read_poll_timeout()
> >
> >  drivers/spi/spi-mem.c       | 71 +++++++++++++++++++++++++++++++++++++
> >  include/linux/spi/spi-mem.h | 10 ++++++
> >  2 files changed, 81 insertions(+)
> >
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index 1513553e4080..3f29c604df7d 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -6,6 +6,7 @@
> >   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
> >   */
> >  #include <linux/dmaengine.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/spi/spi.h>
> >  #include <linux/spi/spi-mem.h>
> > @@ -743,6 +744,75 @@ static inline struct spi_mem_driver
> *to_spi_mem_drv(struct device_driver *drv)
> >       return container_of(drv, struct spi_mem_driver, spidrv.driver);
> >  }
> >
> > +/**
> > + * spi_mem_finalize_op - report completion of spi_mem_op
> > + * @ctlr: the controller reporting completion
> > + *
> > + * Called by SPI drivers using the spi-mem spi_mem_poll_status()
> > + * implementation to notify it that the current spi_mem_op has
> > + * finished.
> > + */
> > +void spi_mem_finalize_op(struct spi_controller *ctlr)
> > +{
> > +     complete(&ctlr->xfer_completion);
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_finalize_op);
> > +
> > +/**
> > + * spi_mem_poll_status() - Poll memory device status
> > + * @mem: SPI memory device
> > + * @op: the memory operation to execute
> > + * @mask: status bitmask to ckeck
> > + * @match: (status & mask) expected value
> > + * @timeout_ms: timeout in milliseconds
> > + *
> > + * This function send a polling status request to the controller drive=
r
> > + *
> > + * Return: 0 in case of success, -ETIMEDOUT in case of error,
> > + *         -EOPNOTSUPP if not supported.
> > + */
> > +int spi_mem_poll_status(struct spi_mem *mem,
> > +                     const struct spi_mem_op *op,
> > +                     u16 mask, u16 match, u16 timeout_ms)
> > +{
> > +     struct spi_controller *ctlr =3D mem->spi->controller;
> > +     unsigned long ms;
> > +     int ret =3D -EOPNOTSUPP;
> > +     int exec_op_ret;
> > +     u16 *status;
> > +
> > +     if (!spi_mem_supports_op(mem, op))
> > +             return ret;
>
> You should only test that in the SW-based polling path. The driver
> ->poll_status() method is expected to check the operation and
> return -EOPNOTSUPP if HW-based polling doesn't work for this op,
> no need to check things twice.
>
> > +
> > +     if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
> > +             ret =3D spi_mem_access_start(mem);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             reinit_completion(&ctlr->xfer_completion);
> > +
> > +             ret =3D ctlr->mem_ops->poll_status(mem, op, mask, match,
> > +                                              timeout_ms);
> > +
> > +             ms =3D wait_for_completion_timeout(&ctlr->xfer_completion=
,
> > +
> msecs_to_jiffies(timeout_ms));
>
> Why do you need to wait here? I'd expect the poll_status to take care
> of this wait.
>
> > +
> > +             spi_mem_access_end(mem);
> > +             if (!ms)
> > +                     return -ETIMEDOUT;
> > +     } else {
> > +             status =3D (u16 *)op->data.buf.in;
>
> Hm, I don't think it's safe, for 2 reasons:
>
> 1/ op->data.buf.in might be a 1byte buffer, but you're doing a 2byte chec=
k
> 2/ data is in big endian in the SPI buffer, which means your check
>    won't work on LE architectures.
>
> You really need a dedicated spi_mem_read_status() function that's passed
> an u16 pointer:
>
> int spi_mem_read_status(struct spi_mem *mem,
>                         const struct spi_mem_op *op,
>                         u16 *status)
> {
>         const u8 *bytes =3D (u8 *)op->data.buf.in;
>         int ret;
>
>         ret =3D spi_mem_exec_op(mem, op);
>         if (ret)
>                 return ret;
>
>         if (op->data.nbytes > 1)
>                 *status =3D ((u16)bytes[0] << 8) | bytes[1];



Don=E2=80=99t we have get_unaligned_be16() with __be16 type for this? Or
be16_to_cpup() if it=E2=80=99s aligned.


>         else
>                 *status =3D bytes[0];
>
>         return 0;
> }
>
> > +             ret =3D read_poll_timeout(spi_mem_exec_op, exec_op_ret,
> > +                                     ((*status) & mask) =3D=3D match, =
20,
> > +                                     timeout_ms * 1000, false, mem, op=
);
> > +             if (exec_op_ret)
> > +                     return exec_op_ret;
> > +     }
> > +
>
> I would do something like this instead:
>
> int spi_mem_poll_status(struct spi_mem *mem,
>                         const struct spi_mem_op *op,
>                         u16 mask, u16 match, u16 timeout_ms)
> {
>         struct spi_controller *ctlr =3D mem->spi->controller;
>         int ret =3D -EOPNOTSUPP;
>
>         if (op->data.nbytes < 1 || op->data.nbytes > 2)
>                 return -EINVAL;
>
>         if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
>                 ret =3D spi_mem_access_start(mem);
>                 if (ret)
>                         return ret;
>
>                 ret =3D ctlr->mem_ops->poll_status(mem, op, mask, match,
>                                                  timeout_ms);
>
>                 spi_mem_access_end(mem);
>         }
>
>
>         if (ret =3D=3D -EOPNOTSUPP) {
>                 u16 status;
>                 int read_status_ret;
>
>                 if (!spi_mem_supports_op(mem, op))
>                         return -EOPNOTSUPP;
>
>                 ret =3D read_poll_timeout(spi_mem_read_status, exec_op_re=
t,
>                                         (read_status_ret || ((status &
> mask) =3D=3D match), 20,
>                                         timeout_ms * 1000, false, mem, op=
,
> &status);
>
>                 if (read_status_ret)
>                         return read_status_ret;
>         }
>
>         return ret;
> }
>
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(spi_mem_poll_status);
> > +
> >  static int spi_mem_probe(struct spi_device *spi)
> >  {
> >       struct spi_mem_driver *memdrv =3D to_spi_mem_drv(spi->dev.driver)=
;
> > @@ -763,6 +833,7 @@ static int spi_mem_probe(struct spi_device *spi)
> >       if (IS_ERR_OR_NULL(mem->name))
> >               return PTR_ERR_OR_ZERO(mem->name);
> >
> > +     init_completion(&ctlr->xfer_completion);
> >       spi_set_drvdata(spi, mem);
> >
> >       return memdrv->probe(mem);
> > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > index 2b65c9edc34e..0fbf5d0a3d31 100644
> > --- a/include/linux/spi/spi-mem.h
> > +++ b/include/linux/spi/spi-mem.h
> > @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct
> spi_mem *mem)
> >   *             the currently mapped area), and the caller of
> >   *             spi_mem_dirmap_write() is responsible for calling it
> again in
> >   *             this case.
> > + * @poll_status: poll memory device status
> >   *
> >   * This interface should be implemented by SPI controllers providing a=
n
> >   * high-level interface to execute SPI memory operation, which is
> usually the
> > @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {
> >                              u64 offs, size_t len, void *buf);
> >       ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
> >                               u64 offs, size_t len, const void *buf);
> > +     int (*poll_status)(struct spi_mem *mem,
> > +                        const struct spi_mem_op *op,
> > +                        u16 mask, u16 match, unsigned long timeout);
> >  };
> >
> >  /**
> > @@ -369,6 +373,12 @@ devm_spi_mem_dirmap_create(struct device *dev,
> struct spi_mem *mem,
> >  void devm_spi_mem_dirmap_destroy(struct device *dev,
> >                                struct spi_mem_dirmap_desc *desc);
> >
> > +void spi_mem_finalize_op(struct spi_controller *ctlr);
> > +
> > +int spi_mem_poll_status(struct spi_mem *mem,
> > +                     const struct spi_mem_op *op,
> > +                     u16 mask, u16 match, u16 timeout);
> > +
> >  int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
> >                                      struct module *owner);
> >
>
>

--=20
With Best Regards,
Andy Shevchenko

--000000000000d5343705c1cd091c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, May 8, 2021, Boris Brezillon &lt;<a href=3D"mailto:bor=
is.brezillon@collabora.com">boris.brezillon@collabora.com</a>&gt; wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Fri, 7 May 2021 15:17:54 +0200<br>
&lt;<a href=3D"mailto:patrice.chotard@foss.st.com">patrice.chotard@foss.st.=
com</a>&gt; wrote:<br>
<br>
&gt; From: Patrice Chotard &lt;<a href=3D"mailto:patrice.chotard@foss.st.co=
m">patrice.chotard@foss.st.com</a>&gt;<br>
&gt; <br>
&gt; With STM32 QSPI, it is possible to poll the status register of the dev=
ice.<br>
&gt; This could be done to offload the CPU during an operation (erase or<br=
>
&gt; program a SPI NAND for example).<br>
&gt; <br>
&gt; spi_mem_poll_status API has been added to handle this feature.<br>
&gt; This new function take care of the offload/non-offload cases.<br>
&gt; <br>
&gt; For the non-offload case, use read_poll_timeout() to poll the status i=
n<br>
&gt; order to release CPU during this phase.<br>
&gt; <br>
&gt; Signed-off-by: Patrice Chotard &lt;<a href=3D"mailto:patrice.chotard@f=
oss.st.com">patrice.chotard@foss.st.com</a>&gt;<br>
&gt; Signed-off-by: Christophe Kerello &lt;<a href=3D"mailto:christophe.ker=
ello@foss.st.com">christophe.kerello@foss.st.<wbr>com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0- Indicates the spi_mem_poll_status() timeout unit<br>
&gt;=C2=A0 =C2=A0- Use 2-byte wide status register<br>
&gt;=C2=A0 =C2=A0- Add spi_mem_supports_op() call in spi_mem_poll_status()<=
br>
&gt;=C2=A0 =C2=A0- Add completion management in spi_mem_poll_status()<br>
&gt;=C2=A0 =C2=A0- Add offload/non-offload case mangement in spi_mem_poll_s=
tatus()<br>
&gt;=C2=A0 =C2=A0- Optimize the non-offload case by using read_poll_timeout=
()<br>
&gt; <br>
&gt;=C2=A0 drivers/spi/spi-mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 71 +++++++++++=
+++++++++++++++++++<wbr>+++++++<br>
&gt;=C2=A0 include/linux/spi/spi-mem.h | 10 ++++++<br>
&gt;=C2=A0 2 files changed, 81 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c<br>
&gt; index 1513553e4080..3f29c604df7d 100644<br>
&gt; --- a/drivers/spi/spi-mem.c<br>
&gt; +++ b/drivers/spi/spi-mem.c<br>
&gt; @@ -6,6 +6,7 @@<br>
&gt;=C2=A0 =C2=A0* Author: Boris Brezillon &lt;<a href=3D"mailto:boris.brez=
illon@bootlin.com">boris.brezillon@bootlin.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #include &lt;linux/dmaengine.h&gt;<br>
&gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/pm_runtime.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/spi/spi.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/spi/spi-mem.h&gt;<br>
&gt; @@ -743,6 +744,75 @@ static inline struct spi_mem_driver *to_spi_mem_d=
rv(struct device_driver *drv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(drv, struct spi_mem_driv=
er, spidrv.driver);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * spi_mem_finalize_op - report completion of spi_mem_op<br>
&gt; + * @ctlr: the controller reporting completion<br>
&gt; + *<br>
&gt; + * Called by SPI drivers using the spi-mem spi_mem_poll_status()<br>
&gt; + * implementation to notify it that the current spi_mem_op has<br>
&gt; + * finished.<br>
&gt; + */<br>
&gt; +void spi_mem_finalize_op(struct spi_controller *ctlr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0complete(&amp;ctlr-&gt;xfer_<wbr>completion);<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(spi_mem_<wbr>finalize_op);<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * spi_mem_poll_status() - Poll memory device status<br>
&gt; + * @mem: SPI memory device<br>
&gt; + * @op: the memory operation to execute<br>
&gt; + * @mask: status bitmask to ckeck<br>
&gt; + * @match: (status &amp; mask) expected value<br>
&gt; + * @timeout_ms: timeout in milliseconds<br>
&gt; + *<br>
&gt; + * This function send a polling status request to the controller driv=
er<br>
&gt; + *<br>
&gt; + * Return: 0 in case of success, -ETIMEDOUT in case of error,<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-EOPNOTSUPP if not supported.<br>
&gt; + */<br>
&gt; +int spi_mem_poll_status(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const struct spi_mem_op *op,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u16 mask, u16 match, u16 timeout_ms)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct spi_controller *ctlr =3D mem-&gt;spi-&gt;c=
ontroller;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long ms;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D -EOPNOTSUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int exec_op_ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 *status;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!spi_mem_supports_op(mem, op))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
You should only test that in the SW-based polling path. The driver<br>
-&gt;poll_status() method is expected to check the operation and<br>
return -EOPNOTSUPP if HW-based polling doesn&#39;t work for this op,<br>
no need to check things twice.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctlr-&gt;mem_ops &amp;&amp; ctlr-&gt;mem_ops-=
&gt;poll_status) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D spi_mem_acces=
s_start(mem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reinit_completion(&am=
p;ctlr-&gt;xfer_<wbr>completion);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ctlr-&gt;mem_=
ops-&gt;poll_status(<wbr>mem, op, mask, match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 timeout_ms);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ms =3D wait_for_compl=
etion_timeout(&amp;<wbr>ctlr-&gt;xfer_completion,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 msecs_to_jiffies(timeout_ms));<br>
<br>
Why do you need to wait here? I&#39;d expect the poll_status to take care<b=
r>
of this wait.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_mem_access_end(me=
m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ms)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ETIMEDOUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D (u16 *)op-=
&gt;<a href=3D"http://data.buf.in" target=3D"_blank">data.buf.in</a>;<br>
<br>
Hm, I don&#39;t think it&#39;s safe, for 2 reasons:<br>
<br>
1/ op-&gt;<a href=3D"http://data.buf.in" target=3D"_blank">data.buf.in</a> =
might be a 1byte buffer, but you&#39;re doing a 2byte check<br>
2/ data is in big endian in the SPI buffer, which means your check<br>
=C2=A0 =C2=A0won&#39;t work on LE architectures.<br>
<br>
You really need a dedicated spi_mem_read_status() function that&#39;s passe=
d<br>
an u16 pointer:<br>
<br>
int spi_mem_read_status(struct spi_mem *mem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const struct spi_mem_op *op,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u16 *status)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const u8 *bytes =3D (u8 *)op-&gt;<a href=3D"htt=
p://data.buf.in" target=3D"_blank">data.buf.in</a>;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D spi_mem_exec_op(mem, op);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;data.nbytes &gt; 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *status =3D ((u16)b=
ytes[0] &lt;&lt; 8) | bytes[1];</blockquote><div><br></div><div><br></div><=
div>Don=E2=80=99t we have get_unaligned_be16() with __be16 type for this? O=
r be16_to_cpup() if it=E2=80=99s aligned.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *status =3D bytes[0=
];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
}<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D read_poll_tim=
eout(spi_mem_<wbr>exec_op, exec_op_ret,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((*status) &=
amp; mask) =3D=3D match, 20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout_ms *=
 1000, false, mem, op);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exec_op_ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return exec_op_ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
<br>
I would do something like this instead:<br>
<br>
int spi_mem_poll_status(struct spi_mem *mem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const struct spi_mem_op *op,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 u16 mask, u16 match, u16 timeout_ms)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spi_controller *ctlr =3D mem-&gt;spi-&gt=
;controller;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D -EOPNOTSUPP;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;data.nbytes &lt; 1 || op-&gt;data.nb=
ytes &gt; 2)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctlr-&gt;mem_ops &amp;&amp; ctlr-&gt;mem_op=
s-&gt;poll_status) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D spi_mem_acc=
ess_start(mem);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ctlr-&gt;me=
m_ops-&gt;poll_status(<wbr>mem, op, mask, match,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout_ms);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi_mem_access_end(=
mem);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -EOPNOTSUPP) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u16 status;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int read_status_ret=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!spi_mem_suppor=
ts_op(mem, op))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EOPNOTSUPP;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D read_poll_t=
imeout(spi_mem_<wbr>read_status, exec_op_ret,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (read_st=
atus_ret || ((status &amp; mask) =3D=3D match), 20,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout_=
ms * 1000, false, mem, op, &amp;status);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (read_status_ret=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return read_status_ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
}<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL_GPL(spi_mem_<wbr>poll_status);<br>
&gt; +<br>
&gt;=C2=A0 static int spi_mem_probe(struct spi_device *spi)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct spi_mem_driver *memdrv =3D to_spi_mem=
_drv(spi-&gt;dev.<wbr>driver);<br>
&gt; @@ -763,6 +833,7 @@ static int spi_mem_probe(struct spi_device *spi)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(mem-&gt;name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR_O=
R_ZERO(mem-&gt;name);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0init_completion(&amp;ctlr-&gt;xfer_<wbr>completio=
n);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spi_set_drvdata(spi, mem);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return memdrv-&gt;probe(mem);<br>
&gt; diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h=
<br>
&gt; index 2b65c9edc34e..0fbf5d0a3d31 100644<br>
&gt; --- a/include/linux/spi/spi-mem.h<br>
&gt; +++ b/include/linux/spi/spi-mem.h<br>
&gt; @@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi=
_mem *mem)<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the curre=
ntly mapped area), and the caller of<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi_mem_d=
irmap_write() is responsible for calling it again in<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this case=
.<br>
&gt; + * @poll_status: poll memory device status<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* This interface should be implemented by SPI controllers =
providing an<br>
&gt;=C2=A0 =C2=A0* high-level interface to execute SPI memory operation, wh=
ich is usually the<br>
&gt; @@ -274,6 +275,9 @@ struct spi_controller_mem_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64 offs, size_t len, void *buf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t (*dirmap_write)(struct spi_mem_dirma=
p_desc *desc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 offs, size_t len, const void *=
buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*poll_status)(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 const struct spi_mem_op *op,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 u16 mask, u16 match, unsigned long timeout);<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt; @@ -369,6 +373,12 @@ devm_spi_mem_dirmap_create(<wbr>struct device *de=
v, struct spi_mem *mem,<br>
&gt;=C2=A0 void devm_spi_mem_dirmap_destroy(<wbr>struct device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct spi_mem_dirmap_desc *desc)=
;<br>
&gt;=C2=A0 <br>
&gt; +void spi_mem_finalize_op(struct spi_controller *ctlr);<br>
&gt; +<br>
&gt; +int spi_mem_poll_status(struct spi_mem *mem,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const struct spi_mem_op *op,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u16 mask, u16 match, u16 timeout);<br>
&gt; +<br>
&gt;=C2=A0 int spi_mem_driver_register_with_<wbr>owner(struct spi_mem_drive=
r *drv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct modul=
e *owner);<br>
&gt;=C2=A0 <br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000d5343705c1cd091c--

--===============6688298487218600826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6688298487218600826==--
