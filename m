Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF945619F
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Nov 2021 18:38:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D19C5E2CC;
	Thu, 18 Nov 2021 17:38:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97C2CC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 17:38:48 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id v23so5694033pjr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Nov 2021 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uZZaIGV1J6dR0MYTZzEkI8MN4x5huF5mh8UM/JBFaIE=;
 b=LfzDXNKilx+XBoNwP82vKixjCJd4LNp979P9/zj9MO1twBuu2i7DdX18C9hOFJly2a
 uxVpRXMxVUqjvkpBRdnTJnTHn62sRCYGQYrVE8uDSpX9Y/qyH4Qfsicvztk3V9lb4OVm
 bJQB4Y2a2aQRDAdU28kYsx31IGa7CnZB9BG9hlMGh0G5lL40wXH4HgJB+r6lid3YReeD
 7UGqa+obJHljiZYYArzBJS7Cs+8UAEX4xHs8jsRXeO03k0QdOju0hhLwv8t1pKjf1Za5
 K5cHbxHzMy2RmFZ5QwLTR+1RtOC2oPJcWmXeZvmlkzh1OnAhkxDjCH1QTvvjhEprgwDf
 UYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uZZaIGV1J6dR0MYTZzEkI8MN4x5huF5mh8UM/JBFaIE=;
 b=FJl+BWE08DRi1jY5TpUmzzbsgbQpP2H9tIrbgWC5tBn1Tu0VjOwxi2n1NhI+ZAckrD
 rs+PCSRd3JhYDDFCmckICGUI2fVCTjes2w8GnUE918jxq+bz8d1rHf8oYd1X3SzA5fYD
 Pf5n7PtBzYpJeWuoy44S8/S2kqp2oXrAugOym0zbWgg5WRHGTPLF1pr/qdeWOfJb1N6+
 M3YvHNZTAazVFzmd+je2DI9PfLRDpfHlC0w/N8N0h4ndyRRgx2x45N7dcqdRF0AhZvuT
 EgGMZX68ahLP7QipAEl1uS064KQhLYqGGBikGVM32oNiz/7MTwdMj2NNJW6eI4BYf1ng
 xqew==
X-Gm-Message-State: AOAM531XUrZGL99OsTRIAayNtncSnrorb+HmxmWvBOI3ezJaVx4rE48Z
 e0DmIOMNlOFt/uyQhbG3muHkEA==
X-Google-Smtp-Source: ABdhPJzIafSm7+krxOYZpZqmelZlXgg5zMDtaTi/0mKeXEfnRV5VWipg3LI4IxuHr/MrdiMYHqgelw==
X-Received: by 2002:a17:902:82c9:b0:142:401f:dc9 with SMTP id
 u9-20020a17090282c900b00142401f0dc9mr68884457plz.43.1637257126770; 
 Thu, 18 Nov 2021 09:38:46 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id j9sm223909pgt.54.2021.11.18.09.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 09:38:45 -0800 (PST)
Date: Thu, 18 Nov 2021 10:38:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211118173842.GD2530497@p14s>
References: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: Fix documentation return formatting
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

On Mon, Nov 08, 2021 at 03:01:26PM +0100, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
>  4 files changed, 15 insertions(+), 15 deletions(-)

I have applied this set.  There is a few more instances in drivers/remoteproc
that could be fixed the same way.

Thanks,
Mathieu

> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 3f377a795b33..1030cfa80e04 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -427,7 +427,7 @@ static void qcom_glink_handle_intent_req_ack(struct qcom_glink *glink,
>   * Allocates a local channel id and sends a RPM_CMD_OPEN message to the remote.
>   * Will return with refcount held, regardless of outcome.
>   *
> - * Returns 0 on success, negative errno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  				    struct glink_channel *channel)
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da1b5cb31b3..540e027f08c4 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1467,7 +1467,7 @@ ATTRIBUTE_GROUPS(qcom_smd_edge);
>   * @parent:    parent device for the edge
>   * @node:      device_node describing the edge
>   *
> - * Returns an edge reference, or negative ERR_PTR() on failure.
> + * Return: an edge reference, or negative ERR_PTR() on failure.
>   */
>  struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>  					     struct device_node *node)
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index d3eb60059ef1..f031b2b1b21c 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -26,7 +26,7 @@
>   * @rpdev: rpmsg device
>   * @chinfo: channel_info to bind
>   *
> - * Returns a pointer to the new rpmsg device on success, or NULL on error.
> + * Return: a pointer to the new rpmsg device on success, or NULL on error.
>   */
>  struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  					  struct rpmsg_channel_info *chinfo)
> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(rpmsg_create_channel);
>   * @rpdev: rpmsg device
>   * @chinfo: channel_info to bind
>   *
> - * Returns 0 on success or an appropriate error value.
> + * Return: 0 on success or an appropriate error value.
>   */
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo)
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(rpmsg_release_channel);
>   * dynamically assign them an available rpmsg address (drivers should have
>   * a very good reason why not to always use RPMSG_ADDR_ANY here).
>   *
> - * Returns a pointer to the endpoint on success, or NULL on error.
> + * Return: a pointer to the endpoint on success, or NULL on error.
>   */
>  struct rpmsg_endpoint *rpmsg_create_ept(struct rpmsg_device *rpdev,
>  					rpmsg_rx_cb_t cb, void *priv,
> @@ -146,7 +146,7 @@ EXPORT_SYMBOL(rpmsg_destroy_ept);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_send(struct rpmsg_endpoint *ept, void *data, int len)
>  {
> @@ -175,7 +175,7 @@ EXPORT_SYMBOL(rpmsg_send);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  {
> @@ -206,7 +206,7 @@ EXPORT_SYMBOL(rpmsg_sendto);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_send_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  			  void *data, int len)
> @@ -235,7 +235,7 @@ EXPORT_SYMBOL(rpmsg_send_offchannel);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysend(struct rpmsg_endpoint *ept, void *data, int len)
>  {
> @@ -263,7 +263,7 @@ EXPORT_SYMBOL(rpmsg_trysend);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
>  {
> @@ -282,7 +282,7 @@ EXPORT_SYMBOL(rpmsg_trysendto);
>   * @filp:	file for poll_wait()
>   * @wait:	poll_table for poll_wait()
>   *
> - * Returns mask representing the current state of the endpoint's send buffers
> + * Return: mask representing the current state of the endpoint's send buffers
>   */
>  __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>  			poll_table *wait)
> @@ -313,7 +313,7 @@ EXPORT_SYMBOL(rpmsg_poll);
>   *
>   * Can only be called from process context (for now).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  			     void *data, int len)
> @@ -623,7 +623,7 @@ EXPORT_SYMBOL(rpmsg_unregister_device);
>   * @rpdrv: pointer to a struct rpmsg_driver
>   * @owner: owning module/driver
>   *
> - * Returns 0 on success, and an appropriate error value on failure.
> + * Return: 0 on success, and an appropriate error value on failure.
>   */
>  int __register_rpmsg_driver(struct rpmsg_driver *rpdrv, struct module *owner)
>  {
> @@ -637,7 +637,7 @@ EXPORT_SYMBOL(__register_rpmsg_driver);
>   * unregister_rpmsg_driver() - unregister an rpmsg driver from the rpmsg bus
>   * @rpdrv: pointer to a struct rpmsg_driver
>   *
> - * Returns 0 on success, and an appropriate error value on failure.
> + * Return: 0 on success, and an appropriate error value on failure.
>   */
>  void unregister_rpmsg_driver(struct rpmsg_driver *rpdrv)
>  {
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..c37451512835 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -547,7 +547,7 @@ static void rpmsg_downref_sleepers(struct virtproc_info *vrp)
>   * should use the appropriate rpmsg_{try}send{to, _offchannel} API
>   * (see include/linux/rpmsg.h).
>   *
> - * Returns 0 on success and an appropriate error value on failure.
> + * Return: 0 on success and an appropriate error value on failure.
>   */
>  static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  				     u32 src, u32 dst,
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
